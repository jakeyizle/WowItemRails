# frozen_string_literal: true

class RenameClassInItems < ActiveRecord::Migration[7.0]
  def change
    rename_column :items, :class, :item_class
    rename_column :items, :subclass, :item_subclass
  end
end
