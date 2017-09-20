# frozen_string_literal: true
# == Schema Information
#
# Table name: sizes
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  name        :string
#  price       :decimal(, )      default(0.0)
#  description :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_sizes_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#

require 'rails_helper'

RSpec.describe Size, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
