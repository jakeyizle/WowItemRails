# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.integer :item_id
      t.string :name
      t.integer :class
      t.integer :subclass
      t.string :type

      t.timestamps
    end
    add_reference :items, :boss
  end
end
