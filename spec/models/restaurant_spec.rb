# frozen_string_literal: true
# == Schema Information
#
# Table name: restaurants
#
#  id                             :integer          not null, primary key
#  user_id                        :integer
#  name                           :string           not null
#  address                        :string           not null
#  wifipassword                   :string
#  phone_number                   :string
#  country                        :string           default("en-GB")
#  google_id                      :string
#  code                           :string           not null
#  latitude                       :float
#  longitude                      :float
#  restaurant_avatar_file_name    :string
#  restaurant_avatar_content_type :string
#  restaurant_avatar_file_size    :integer
#  restaurant_avatar_updated_at   :datetime
#  created_at                     :datetime         not null
#  updated_at                     :datetime         not null
#  slug                           :string
#
# Indexes
#
#  index_restaurants_on_slug     (slug) UNIQUE
#  index_restaurants_on_user_id  (user_id)
#

require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
