# frozen_string_literal: true

class CreateStats < ActiveRecord::Migration[7.0]
  def change
    create_table :stats do |t|
      t.string :type
      t.integer :value

      t.timestamps
    end
    add_reference :stats, :item
  end
end
