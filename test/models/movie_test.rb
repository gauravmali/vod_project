require 'test_helper'

class MovieTest < ActiveSupport::TestCase
  test "Create an Movie successfully" do
    movie = movies(:one)
    assert movie
  end

  test "Do not create Movie without plot" do
    episode = Movie.new(title: "WRONG")
    assert_not episode.save
  end

  test "Clear cache" do
    movie = movies(:one)
    assert_nil movie.send(:clear_cache)
  end
end
