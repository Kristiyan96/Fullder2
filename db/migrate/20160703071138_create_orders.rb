# frozen_string_literal: true
class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :restaurant,     index: true, foreign_key: true
      t.references :user,           index: true, foreign_key: true
      t.decimal :subtotal
      t.decimal :total

      t.timestamps null: false
    end
  end
end
