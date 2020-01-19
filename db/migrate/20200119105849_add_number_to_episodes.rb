class AddNumberToEpisodes < ActiveRecord::Migration[5.1]
  def change
    add_column :episodes, :number, :integer
  end
end
