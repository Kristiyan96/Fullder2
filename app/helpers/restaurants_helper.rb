# frozen_string_literal: true
module RestaurantsHelper
  def formatted_price(price, restaurant)
    restaurant ||= Restaurant.new
    number_to_currency(price, locale: restaurant.country.to_sym)
  end

end
