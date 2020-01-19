class Movie < ApplicationRecord
  validates_presence_of :title, :plot

  after_update :clear_cache
  after_create :clear_cache

  has_many :purchases
  has_many :users, :through => :purchases

  private

  def clear_cache
    Rails.cache.delete('movies_cache')
    Rails.cache.delete('movies_and_seasons_cache')
  end
end
