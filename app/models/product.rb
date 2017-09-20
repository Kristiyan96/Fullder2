# frozen_string_literal: true
# == Schema Information
#
# Table name: products
#
#  id                   :integer          not null, primary key
#  restaurant_id        :integer
#  category_id          :integer
#  name                 :string
#  short_description    :string
#  weight               :string
#  description          :text
#  price                :decimal(, )      not null
#  average_prepare_time :integer
#  avatar_file_name     :string
#  avatar_content_type  :string
#  avatar_file_size     :integer
#  avatar_updated_at    :datetime
#  created_at           :datetime
#  updated_at           :datetime
#
# Indexes
#
#  index_products_on_category_id    (category_id)
#  index_products_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (restaurant_id => restaurants.id)
#

class Product < ApplicationRecord
  belongs_to :restaurant
  belongs_to :category

  has_many :sizes, dependent: :destroy
  has_many :groups, dependent: :destroy
  has_many :options, through: :groups
  has_many :order_items

  accepts_nested_attributes_for :sizes, allow_destroy: true
  accepts_nested_attributes_for :groups, allow_destroy: true

  has_attached_file :avatar, styles: { small: '140x140#', large: '250x250#' }, default_url: '/images/:style/missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  validates :name, presence: true
  validates :category_id, presence: true
  validates :price, presence: true

  translates :name, :short_description, :description

  scope :search, -> (keyword) do
    unless keyword.blank?
      keyword = "%#{keyword}%"
      where('products.name ilike ?',
            keyword)
    end
  end
end
