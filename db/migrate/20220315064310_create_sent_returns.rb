class CreateSentReturns < ActiveRecord::Migration[6.1]
  def change
    create_table :sent_returns do |t|
      t.integer :sent_item_id
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
