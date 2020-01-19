require 'test_helper'

class ShowsControllerTest < ActionDispatch::IntegrationTest
  test "should get movies" do
    Rails.cache.delete('movies_cache')
    get movies_url, as: :json
    assert_response 200
    assert_response :success
  end

  test "should get seasons" do
    Rails.cache.delete('seasons_cache')
    get seasons_url, as: :json
    assert_response 200
    assert_response :success
  end

  test "should get movies_and_seasons" do
    Rails.cache.delete('movies_and_seasons_cache')
    get movies_and_seasons_url, as: :json
    assert_response 200
    assert_response :success
  end

  test "should not purchase if user is invalid" do
    post purchase_url, as: :json
    assert_response 200
    assert_response :success
    expected_response = "{\"status\":\"failure\",\"message\":\"Not a valid user\"}"
    assert_equal expected_response, @response.body
  end

  test "should purchase a movie if user is valid" do
    post purchase_url,params: { "user_id": users(:one).id,
                                "type": "movie",
                                "title": movies(:one).title,
                                "quality": "hd",
                                "price": "2.99"
    }, as: :json
    assert_response 200
    assert_response :success
    expected_response = "{\"status\":\"success\",\"message\":\"MOVIE: MYSTRING purchase is successful\"}"
    assert_equal expected_response, @response.body
  end

  test "should not be able to purchase same movie again" do
    post purchase_url,params: { "user_id": users(:one).id,
                                "type": "movie",
                                "title": movies(:one).title,
                                "quality": "hd",
                                "price": "2.99"
    }, as: :json
    assert_response 200
    assert_response :success
    expected_response = "{\"status\":\"success\",\"message\":\"MOVIE: MYSTRING purchase is successful\"}"
    assert_equal expected_response, @response.body

    post purchase_url,params: { "user_id": users(:one).id,
                                "type": "movie",
                                "title": movies(:one).title,
                                "quality": "hd",
                                "price": "2.99"
    }, as: :json
    expected_response = "{\"status\":\"failure\",\"message\":\"MOVIE: MYSTRING already exist in library\"}"
    assert_equal expected_response, @response.body
  end

  test "should purchase a season if user is valid" do
    post purchase_url,params: { "user_id": users(:one).id,
                                "type": "season",
                                "title": seasons(:one).title,
                                "quality": "hd",
                                "price": "2.99",
                                "season_number": "1"
    }, as: :json
    assert_response 200
    assert_response :success
    expected_response = "{\"status\":\"success\",\"message\":\"SEASON: MYSTRING purchase is successful\"}"
    assert_equal expected_response, @response.body
  end

  test "should not be able to purchase same season again" do
    post purchase_url,params: { "user_id": users(:one).id,
                                "type": "season",
                                "title": seasons(:one).title,
                                "quality": "hd",
                                "price": "2.99",
                                "season_number": "1"
    }, as: :json
    assert_response 200
    assert_response :success
    expected_response = "{\"status\":\"success\",\"message\":\"SEASON: MYSTRING purchase is successful\"}"
    assert_equal expected_response, @response.body

    post purchase_url,params: { "user_id": users(:one).id,
                                "type": "season",
                                "title": seasons(:one).title,
                                "quality": "hd",
                                "price": "2.99",
                                "season_number": "1"
    }, as: :json
    expected_response = "{\"status\":\"failure\",\"message\":\"SEASON: MYSTRING already exist in library\"}"
    assert_equal expected_response, @response.body
  end

  test "should not get user library if user in invalid" do
    get library_url, as: :json
    assert_response 200
    assert_response :success
    expected_response = "{\"status\":\"failure\",\"message\":\"Not a valid user\"}"
    assert_equal expected_response, @response.body
  end

  test "should get user library" do
    post purchase_url,params: { "user_id": users(:one).id,
                                "type": "movie",
                                "title": movies(:one).title,
                                "quality": "hd",
                                "price": "2.99"
    }, as: :json

    post purchase_url,params: { "user_id": users(:one).id,
                                "type": "season",
                                "title": seasons(:one).title,
                                "quality": "hd",
                                "price": "2.99",
                                "season_number": "1"
    }, as: :json
    get "/library?user_id=#{users(:one).id}", as: :json
    assert_response 200
    assert_response :success
    assert_equal 2, (JSON.parse(@response.body)["data"].count)
  end
end
