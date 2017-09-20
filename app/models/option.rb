# frozen_string_literal: true
# == Schema Information
#
# Table name: options
#
#  id         :integer          not null, primary key
#  group_id   :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  price      :decimal(, )      default(0.0), not null
#
# Indexes
#
#  index_options_on_group_id  (group_id)
#
# Foreign Keys
#
#  fk_rails_...  (group_id => groups.id)
#

class Option < ApplicationRecord
  belongs_to :group

  has_many :options_order_items

  validates :name, presence: true 

  translates :name

  def name_and_price
    "<b>#{name}</b> <span class='price pull-right'>+ #{ActiveSupport::NumberHelper.number_to_currency(price, locale: group.product.restaurant.country.to_sym)}</span>" 
  end
end
