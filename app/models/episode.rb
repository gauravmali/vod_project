class Episode < ApplicationRecord
  validates_presence_of :title, :plot, :number

  after_update :clear_cache
  after_create :clear_cache

  belongs_to :season

  private

  def clear_cache
    Rails.cache.delete('seasons_cache')
    Rails.cache.delete('movies_and_seasons_cache')
  end
end
