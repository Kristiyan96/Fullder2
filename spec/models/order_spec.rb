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

require 'rails_helper'

RSpec.describe Order, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
