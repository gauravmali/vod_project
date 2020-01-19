if @shows_service.seasons.present?
  seasons = @shows_service.seasons
  json.status 'success'
  json.data do
    json.array! seasons do |season|
      episodes = season.episodes
      json.title season.title
      json.plot season.plot
      json.episodes do
        json.array! episodes do |episode|
          json.title episode.title
          json.plot episode.plot
          json.episode_number episode.number
        end
      end
    end
  end
else
  json.status = 'failure'
  json.set! :data, []
end
