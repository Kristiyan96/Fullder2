# frozen_string_literal: true
# == Schema Information
#
# Table name: restaurants
#
#  id                             :integer          not null, primary key
#  user_id                        :integer
#  name                           :string           not null
#  address                        :string           not null
#  wifipassword                   :string
#  phone_number                   :string
#  country                        :string           default("en-GB")
#  google_id                      :string
#  code                           :string           not null
#  latitude                       :float
#  longitude                      :float
#  restaurant_avatar_file_name    :string
#  restaurant_avatar_content_type :string
#  restaurant_avatar_file_size    :integer
#  restaurant_avatar_updated_at   :datetime
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  slug                           :string
#
# Indexes
#
#  index_restaurants_on_slug     (slug) UNIQUE
#  index_restaurants_on_user_id  (user_id)
#

class Restaurant < ApplicationRecord
  extend FriendlyId
  belongs_to :user

  has_many :categories, dependent: :destroy
  has_many :products, dependent: :destroy
  has_many :orders
  has_many :order_items, through: :orders
  has_attached_file :restaurant_avatar, styles: { small: '300x300#', large: '1000x800' },
                                        default_url: 'missing.png'

  validates :name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates_attachment_content_type :restaurant_avatar,
                                    content_type: /\Aimage\/.*\Z/
  after_validation :geocode, if: :address_changed? # auto-fetch coordinates
                                         
  friendly_id :slugged_candidates, use: :slugged
  geocoded_by :address # can also be an IP address
  acts_as_mappable :default_units => :kms,
                   :default_formula => :flat,
                   :lat_column_name => :latitude,
                   :lng_column_name => :longitude

  scope :search, -> (keyword) do
    unless keyword.blank?
      keywords = keyword.split(/\W+/) 
      tagged_with(keywords)
    end
  end

  def slugged_candidates
    [
      :name,
      [:name, :address],
      [:name, :longitude, :latitude],
      [:name, :address, :longitude, :latitude]
    ]
  end

  def generate_code
    self.code = rand(36**4).to_s(36)
    generate_code if Restaurant.exists?(code: self.code)
  end
end
