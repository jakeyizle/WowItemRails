# frozen_string_literal: true

class RenameTypeInAllTables < ActiveRecord::Migration[7.0]
  def change
    rename_column :zones, :type, :zone_type
    rename_column :items, :type, :item_type
    rename_column :stats, :type, :stat_type
  end
end
