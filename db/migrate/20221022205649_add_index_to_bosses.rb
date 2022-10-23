# frozen_string_literal: true

class AddIndexToBosses < ActiveRecord::Migration[7.0]
  def change
    add_index :bosses, :boss_id, unique: true
  end
end
