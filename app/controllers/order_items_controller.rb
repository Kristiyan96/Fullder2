# frozen_string_literal: true
class OrderItemsController < ApplicationController
  include OrderItemsHelper
  before_action :authenticate_user!

  def create
    @restaurant = Restaurant.find(session[:restaurant_id])
    @order_item = OrderItem.new(order_item_params)
    @order_item.restaurant_id = @restaurant.id
    respond_to do |format|
      unless order_exists?
        new_order = Order.create(user_id: current_user.id, restaurant_id: @restaurant.id)
        session[:order_id] = new_order.id
      end
      add_item
      format.js
    end
  end

  def update
    @order_item = current_order.order_items.find(params[:id])
    @order_item.update_attributes(order_item_params)

    respond_to do |format|
      if @order_item.update(order_item_params)
        @order_items = current_order.order_items.order('created_at')
        format.html { redirect_to cart_path }
        format.json { render json: current_order.subtotal }
        format.js   
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_item = current_order.order_items.find(params[:id])
    @order_item.destroy
    @order_items = current_order.order_items.order('updated_at')
  end

  private

  def order_item_params
    params.require(:order_item).permit(:quantity, :product_id, :size_id, :restaurant_id,
                                       option_ids: [])
  end
end
