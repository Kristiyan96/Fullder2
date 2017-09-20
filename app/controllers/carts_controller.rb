# frozen_string_literal: true
class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @order_items = current_order.order_items.order('created_at')
    @restaurant = current_order.restaurant
  end
end
