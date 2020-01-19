require 'test_helper'

class EpisodeTest < ActiveSupport::TestCase
  test 'Create an Episode successfully' do
    episode = episodes(:one)
    assert episode
  end

  test 'Do not create Episode without plot and season' do
    episode = Episode.new(title: 'WRONG')
    assert_not episode.save
  end

  test 'Clear cache' do
    Rails.cache.fetch('seasons_cache', {})
    Rails.cache.fetch('movies_and_seasons_cache', {})
    episode = episodes(:one)
    episode.send(:clear_cache)
  end
end
