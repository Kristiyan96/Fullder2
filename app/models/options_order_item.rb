# frozen_string_literal: true
# == Schema Information
#
# Table name: options_order_items
#
#  id            :integer          not null, primary key
#  option_id     :integer
#  order_item_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_options_order_items_on_option_id      (option_id)
#  index_options_order_items_on_order_item_id  (order_item_id)
#
# Foreign Keys
#
#  fk_rails_...  (option_id => options.id)
#  fk_rails_...  (order_item_id => order_items.id)
#

class OptionsOrderItem < ApplicationRecord
  belongs_to :option
  belongs_to :order_item
end
