class ShowsController < ApplicationController
  # before_action :set_clock, only: [:show, :edit, :update, :destroy]

  # Returns the movies, ordered by creation.
  def movies
    Rails.cache.fetch('movies_cache') { shows_movies_service.perform }
  end

  def seasons
    Rails.cache.fetch('seasons_cache') { shows_seasons_service.perform }
  end

  def movies_and_seasons
    Rails.cache.fetch('movies_and_seasons_cache') { shows_movies_and_seasons_service.perform }
  end

  def purchase
    shows_purchase_service.purchase
  end

  def user_library
    shows_library_service.library
  end

  private

  def shows_movies_service
    @shows_service = ShowsService.new(type: 'movies')
  end

  def shows_seasons_service
    @shows_service = ShowsService.new(type: 'seasons')
  end

  def shows_movies_and_seasons_service
    @shows_service = ShowsService.new(type: 'movies_and_seasons')
  end

  def shows_purchase_service
    @shows_service = ShowsService.new(purchase_params)
  end

  def shows_library_service
    @shows_service = ShowsService.new(list_library_params)
  end

  def purchase_params
    params.permit(:user_id, :type, :title, :quality, :price, :season_number)
  end

  def list_library_params
    params.permit(:user_id)
  end
end
