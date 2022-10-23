# frozen_string_literal: true

class AddIndexToZones < ActiveRecord::Migration[7.0]
  def change
    add_index :zones, :zone_id, unique: true
  end
end
