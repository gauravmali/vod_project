if @shows_service.movies.present?
  movies = @shows_service.movies
  json.status 'success'
  json.data do
    json.array! movies do |movie|
      json.title movie.title
      json.plot movie.plot
    end
  end
else
  json.status = 'failure'
  json.set! :data, []
end
