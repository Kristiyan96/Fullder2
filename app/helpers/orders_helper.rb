# frozen_string_literal: true
module OrdersHelper
  def order_restaurant
    current_order.order_items.first.product.restaurant
  end

  def delete_unpaid_orders
    current_user.orders.where(order_status_id: "1").destroy_all
  end

  def table_number
    @restaurant.tables.find(object.table_id).number
  end

  def ready_items
    @restaurant.orders.first
  end

  def awaiting_items

  end
end
