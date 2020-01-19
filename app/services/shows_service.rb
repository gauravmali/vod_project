class ShowsService
  attr_reader :movies, :seasons, :user, :response

  def initialize(params)
    @params = params
    @type = params[:type]
  end

  def perform
    case type
    when 'movies'
      @movies = Movie.all.order(:created_at)
    when 'seasons'
      @seasons = Season.all.order(:created_at)
    when 'movies_and_seasons'
      @movies = Movie.all.order(:created_at)
      @seasons = Season.all.order(:created_at)
    end
  end

  def purchase
    @user = User.find(params[:user_id])
    return existing_show_response if existing_show?
    capture_purchase
    success_response
  rescue ActiveRecord::RecordNotFound
    Rails.logger.error "ERROR: Record not found || Paras: #{params}"
  end

  private

  attr_reader :type, :params, :season, :movie

  def existing_show?
    case params[:type]
    when 'movie'
      @movie = Movie.where(title: params[:title]).last
      if user.movies.map {|rec| rec.title}.include? params[:title]
        movie_validity?
      else
        false
      end
    when 'season'
      @season = Season.where(title: params[:title], number: params[:season_number]).last
      if user.seasons.map {|rec| {rec.title => rec.number}}.include? ({params[:title] => params[:season_number].to_i})
        season_validity?
      else
        false
      end
    end
  end

  def existing_show_response
    @response = { status: 'failure', message: "#{ params[:type].upcase }: #{ params[:title].upcase } already exist in library" }
  end

  def capture_purchase
    Purchase.create!(price: params[:price],
                     quality: params[:quality],
                     user: user,
                     season: season,
                     movie: movie
    )
  end

  def movie_validity?
    user.purchases.each do |purchase|
      @purchase = purchase if purchase.movie == movie
    end
    @purchase.alive?
  end

  def season_validity?

    user.purchases.each do |purchase|
      @purchase = purchase if purchase.season == season
    end
    @purchase.alive?
  end

  def success_response
    @response = { status: 'success', message: "#{ params[:type].upcase }: #{ params[:title].upcase } purchase is successful" }
  end
end
