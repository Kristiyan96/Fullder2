class OrdersController < ApplicationController
  load_and_authorize_resource
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:new]

  def new
    @order = Order.new
  end

  def edit
  end

  def create
    restaurant = Restaurant.find_by(code: order_params[:restaurant_id])
    if restaurant
      @order = current_user.orders.new(order_params)
      @order.restaurant_id = restaurant.id

      respond_to do |format|
        if @order.save
          session[:order_id] = @order.id
          unless params[:from] == "start ordering"
            @order.order_items << OrderItem.new(session[:order_item])
            redirect_to restaurant_path(@order.restaurant, menu: "open") and return
          end

          format.html { redirect_to restaurant_path(@order.restaurant, menu: "open") }
        else
          format.html { render :new }
          format.json { render json: @order.errors, status: :unprocessable_entity }
        end
      end
    else
      flash[:error] = "Wrong table code. Please try again."
      redirect_to restaurants_path
    end
  end

  def update
    respond_to do |format|
      if current_order.update(order_params)
        session[:order_id] = current_order.id
        format.html { redirect_to restaurant_product_path(order_restaurant, session[:product_id]) }
        format.json { render :show, status: :ok, location: order_restaurant }
      else
        format.html { render :edit }
        format.json { render json: current_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    current_order.order_items.destroy_all
    @order_items = current_order.order_items.order('updated_at')
  end

  private
  def set_restaurant
    @restaurant = Restaurant.find(session[:restaurant_id])
  end

  def order_params
    params.require(:order).permit(:restaurant_id)
  end
end
