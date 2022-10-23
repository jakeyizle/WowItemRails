# frozen_string_literal: true

class Region < ApplicationRecord
  def self.all
    {
        "North America" => "us",
        "Europe" => "eu",
        "Korea" => "kr",
        "Taiwan" => "tw",
        "China" => "cn",
}
  end

  def self.default
    "us"
  end
end
