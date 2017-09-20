# frozen_string_literal: true
# == Schema Information
#
# Table name: categories
#
#  id                  :integer          not null, primary key
#  restaurant_id       :integer
#  name                :string
#  available_all_day   :boolean
#  avatar_file_name    :string
#  avatar_content_type :string
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  index               :integer
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  slug                :string
#
# Indexes
#
#  index_categories_on_restaurant_id           (restaurant_id)
#  index_categories_on_restaurant_id_and_slug  (restaurant_id,slug) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (restaurant_id => restaurants.id)
#

class Category < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: [:slugged, :scoped], :scope => :restaurant

  belongs_to :restaurant

  has_many :products

  has_attached_file :avatar, styles: { small: '140x140#', large: '800x800' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  validates :name, presence: true 

  translates :name
  
  scope :search, -> (keyword) do
    unless keyword.blank?
      keyword = "%#{keyword}%"
      with_translations.where('categories.name ilike ?', keyword)
    end
  end
end
