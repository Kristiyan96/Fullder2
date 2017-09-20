module OrderItemsHelper

  def order_exists?
    current_order.restaurant_id == @restaurant.id
  end

  # Adds the order item to the current_order
  def add_item
    current_order.order_items << @order_item
    current_order.save
  end

  def option_names(item)
    names = []
    item.options.each do |opt|
      names << opt.name
    end
    names
  end
end
