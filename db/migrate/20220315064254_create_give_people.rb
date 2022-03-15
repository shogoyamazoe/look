class CreateGivePeople < ActiveRecord::Migration[6.1]
  def change
    create_table :give_people do |t|
      t.string :give_person
      t.string :involvement

      t.timestamps
    end
  end
end
