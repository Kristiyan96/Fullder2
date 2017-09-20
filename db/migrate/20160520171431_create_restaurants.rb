# frozen_string_literal: true
class CreateRestaurants < ActiveRecord::Migration
  def up
    create_table :restaurants do |t|
      t.references :user,                index: true
      t.string :name,                    null: false
      t.string :address,                 null: false, unique: true
      t.string :wifipassword
      t.string :phone_number
      t.string :country,                 default: 'en-GB'
      t.string :google_id
      t.string :code,                    unique: true, null: false
      t.float :latitude
      t.float :longitude
      t.attachment :restaurant_avatar

      t.timestamps                       null: false
    end
  end

  def down
    drop_table :restaurants
  end
end
