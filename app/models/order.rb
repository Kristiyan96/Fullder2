# frozen_string_literal: true
# == Schema Information
#
# Table name: orders
#
#  id            :integer          not null, primary key
#  restaurant_id :integer
#  user_id       :integer
#  subtotal      :decimal(, )
#  total         :decimal(, )
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_orders_on_restaurant_id  (restaurant_id)
#  index_orders_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (restaurant_id => restaurants.id)
#  fk_rails_...  (user_id => users.id)
#

class Order < ApplicationRecord
  belongs_to :restaurant
  belongs_to :user

  has_many :order_items, dependent: :destroy

  before_save :update_subtotal
  after_validation :set_total

  def subtotal
    order_items.collect { |oi| oi.valid? ? oi.total_price : 0 }.sum
  end

  private

  def update_subtotal
    self[:subtotal] = subtotal
  end

  def set_total
    total = subtotal
  end
end
