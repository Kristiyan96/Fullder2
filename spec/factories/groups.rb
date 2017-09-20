# frozen_string_literal: true
# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  product_id :integer
#  maximum    :integer
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_groups_on_product_id  (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#

FactoryGirl.define do
  factory :group do
    maximum 1
    name 'MyString'
  end
end
