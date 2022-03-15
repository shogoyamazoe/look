class CreateFamilyPeople < ActiveRecord::Migration[6.1]
  def change
    create_table :family_people do |t|
      t.string :family_person

      t.timestamps
    end
  end
end
