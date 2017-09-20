# frozen_string_literal: true
class Dashboard::RestaurantsController < ApplicationController
  load_and_authorize_resource find_by: :slug
  before_action :authenticate_user!
  before_action :set_restaurant, only: [:show, :edit, :update, :import]

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.generate_code
    debugger

    respond_to do |format|
      if @restaurant.save
        format.html do
          redirect_to edit_dashboard_restaurant_path(@restaurant),
                      flash: { notice: 'Restaurant was successfully created.' }
        end
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def import
    upload = params[:file]
    File.open(Rails.root.join('tmp/menu_import', upload.original_filename), 'wb') do |file|
      file.write(upload.read)
    end
    @restaurant = Restaurant.friendly.find(params[:restaurant_id])
    MenuImportWorker.perform_async(@restaurant.id, upload.original_filename)
    redirect_to dashboard_restaurant_path(@restaurant),
                notice: 'File was uploaded successfully and is being processed.'
  end

  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to edit_dashboard_restaurant_path(@restaurant), flash: { notice: 'Restaurant was successfully updated.' } }
        format.json { render :edit, status: :ok, location: @restaurant }
      else
        format.html { render :edit }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.friendly.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :country, :address, :phone_number, :wifipassword, :avg_meal_price, :restaurant_avatar)
  end
end
