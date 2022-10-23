# frozen_string_literal: true

class Item < ApplicationRecord
  belongs_to :boss

  def self.search(search)
    if search
      item = Item.find_by(name: search)
      if item
        [item]
      else
        Item.all
      end
    else
      Item.all
    end
  end
end
