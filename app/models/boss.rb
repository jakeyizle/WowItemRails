# frozen_string_literal: true

class Boss < ApplicationRecord
  validates_uniqueness_of :boss_id
end
