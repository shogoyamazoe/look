class CreateGiveItems < ActiveRecord::Migration[6.1]
  def change
    create_table :give_items do |t|
      t.integer :user_id
      t.integer :give_person_id
      t.integer :family_person_id
      t.date :give_day
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
