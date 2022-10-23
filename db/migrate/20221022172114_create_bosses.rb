# frozen_string_literal: true

class CreateBosses < ActiveRecord::Migration[7.0]
  def change
    create_table :bosses do |t|
      t.integer :boss_id
      t.string :name

      t.timestamps
    end
    add_reference :bosses, :zone
  end
end
