# frozen_string_literal: true

class AddIndexToItems < ActiveRecord::Migration[7.0]
  def change
    add_index :items, :item_id, unique: true
  end
end
