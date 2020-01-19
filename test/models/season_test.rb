require 'test_helper'

class SeasonTest < ActiveSupport::TestCase
  test 'Create an Season successfully' do
    season = seasons(:one)
    assert season
  end

  test 'Do not create Season without plot' do
    season = Season.new(title: 'WRONG')
    assert_not season.save
  end

  test 'Clear cache' do
    Rails.cache.fetch('seasons_cache', {})
    Rails.cache.fetch('movies_and_seasons_cache', {})
    season = seasons(:one)
    season.send(:clear_cache)
  end
end
