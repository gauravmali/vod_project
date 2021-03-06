# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_200_119_105_849) do
  create_table 'episodes', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'title'
    t.text 'plot'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'season_id'
    t.integer 'number'
    t.index ['season_id'], name: 'index_episodes_on_season_id'
  end

  create_table 'movies', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'title'
    t.text 'plot'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'purchases', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.float 'price', limit: 24
    t.string 'quality'
    t.string 'validity'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'user_id', null: false
    t.integer 'movie_id'
    t.integer 'season_id'
    t.index ['movie_id'], name: 'index_purchases_on_movie_id'
    t.index ['season_id'], name: 'index_purchases_on_season_id'
    t.index ['user_id'], name: 'index_purchases_on_user_id'
  end

  create_table 'seasons', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'title'
    t.text 'plot'
    t.integer 'number'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'users', force: :cascade, options: 'ENGINE=InnoDB DEFAULT CHARSET=utf8' do |t|
    t.string 'email'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
