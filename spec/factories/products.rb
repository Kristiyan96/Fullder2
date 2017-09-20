# frozen_string_literal: true
# == Schema Information
#
# Table name: products
#
#  id                   :integer          not null, primary key
#  restaurant_id        :integer
#  category_id          :integer
#  name                 :string
#  short_description    :string
#  weight               :string
#  description          :text
#  price                :decimal(, )      not null
#  average_prepare_time :integer
#  avatar_file_name     :string
#  avatar_content_type  :string
#  avatar_file_size     :integer
#  avatar_updated_at    :datetime
#  created_at           :datetime
#  updated_at           :datetime
#
# Indexes
#
#  index_products_on_category_id    (category_id)
#  index_products_on_restaurant_id  (restaurant_id)
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#  fk_rails_...  (restaurant_id => restaurants.id)
#

FactoryGirl.define do
  factory :product do
    name 'MyString'
    price '9.99'
    active false
    description 'MyText'
    short_description 'MyString'
  end
end
