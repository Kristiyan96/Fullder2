# frozen_string_literal: true
# == Schema Information
#
# Table name: order_items
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  product_id    :integer
#  order_id      :integer
#  size_id       :integer
#  unit_price    :decimal(, )
#  quantity      :integer
#  total_price   :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_order_items_on_order_id       (order_id)
#  index_order_items_on_product_id     (product_id)
#  index_order_items_on_restaurant_id  (restaurant_id)
#  index_order_items_on_size_id        (size_id)
#
# Foreign Keys
#
#  fk_rails_...  (order_id => orders.id)
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (restaurant_id => restaurants.id)
#  fk_rails_...  (size_id => sizes.id)
#

class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product
  belongs_to :size
  belongs_to :restaurant

  has_many :options_order_items, dependent: :destroy
  has_many :options, through: :options_order_items
  accepts_nested_attributes_for :options

  validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :size_selected
  validate :options_allowed?

  before_save :finalize

  def unit_price
    if persisted?
      self[:unit_price]
    else
      options_total_price = options.map(&:price).inject(0, &:+) || 0
      size_total_price = product.sizes.find_by_id(size_id).try(:price) || 0
      product.price = product.price + options_total_price + size_total_price
    end
  end

  def total_price
    unit_price * quantity
  end

  def size_selected
    self[:size_id] = product.sizes.first.id if product.sizes.any? && size_id.nil?
  end

  def finalize
    self[:unit_price] = unit_price
    self[:total_price] = quantity * self[:unit_price]
  end

  def options_allowed?
    options.each do |option|
      if options.where(group_id: option.group.id).count > option.group.maximum
        errors.add(:product_id, message: 'Do not exceed the maximum for options!')
      end
    end
  end
end
