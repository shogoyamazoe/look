class CreateSentPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :sent_people do |t|
      t.string :sent_person
      t.string :involvement

      t.timestamps
    end
  end
end
