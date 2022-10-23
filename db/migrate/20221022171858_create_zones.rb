# frozen_string_literal: true

class CreateZones < ActiveRecord::Migration[7.0]
  def change
    create_table :zones do |t|
      t.integer :zone_id
      t.string :name
      t.string :type

      t.timestamps
    end
  end
end
