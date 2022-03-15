class CreateSentItems < ActiveRecord::Migration[6.1]
  def change
    create_table :sent_items do |t|
      t.integer :user_id
      t.integer :sent_person_id
      t.date :sent_day
      t.string :reason
      t.text :introduction
      t.string :product
      t.integer :price
      t.integer :genre_id
      t.string :image

      t.timestamps
    end
  end
end
