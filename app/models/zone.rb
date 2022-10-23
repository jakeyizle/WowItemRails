# frozen_string_literal: true

class Zone < ApplicationRecord
  validates_uniqueness_of :zone_id
end
