require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  test "Create an Season successfully" do
    season = seasons(:one)
    assert season
  end

  test "Do not create Season without plot" do
    season = Season.new(title: "WRONG")
    assert_not season.save
  end

  test "Clear cache" do
    season = seasons(:one)
    assert_nil season.send(:clear_cache)
  end
end
