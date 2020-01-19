if @shows_service.movies.present?
  movies = @shows_service.movies
  seasons = @shows_service.seasons
  json.status 'success'
  json.data do
    json.movies do
      json.array! movies do |movie|
                          json.title movie.title
                          json.plot movie.plot
                      end
    end
    json.seasons do
          json.array! seasons do |season|
                              json.title season.title
                              json.plot season.plot
                          end
        end
  end
else
  json.status = 'failure'
  json.set! :data, []
end
