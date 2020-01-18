class AddUserIdMovieIdSeasonIdToPurchases < ActiveRecord::Migration[5.1]
  def change
    add_column :purchases, :user_id, :integer, null: false
    add_index  :purchases, :user_id

    add_column :purchases, :movie_id, :integer, null: true
    add_index  :purchases, :movie_id

    add_column :purchases, :season_id, :integer, null: true
    add_index  :purchases, :season_id
  end
end
