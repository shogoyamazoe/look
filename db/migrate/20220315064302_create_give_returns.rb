class CreateGiveReturns < ActiveRecord::Migration[6.1]
  def change
    create_table :give_returns do |t|
      t.integer :give_item_id
      t.date :return_day
      t.text :introduction
      t.string :product
      t.integer :price
      t.integer :genre_id
      t.string :image

      t.timestamps
    end
  end
end
