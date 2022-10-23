# frozen_string_literal: true

require "test_helper"

class ItemControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get item_index_url
    assert_response :success
  end

  test "should get search" do
    get item_search_url
    assert_response :success
  end
end
