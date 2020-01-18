class CreatePurchases < ActiveRecord::Migration[5.1]
  def change
    create_table :purchases do |t|
      t.float :price
      t.string :quality
      t.string :validity

      t.timestamps
    end
  end
end
