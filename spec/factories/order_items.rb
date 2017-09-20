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

FactoryGirl.define do
  factory :order_item do
    product nil
    order nil
    product_size nil
    unit_price '9.99'
    quantity 1
    total_price '9.99'
  end
end
