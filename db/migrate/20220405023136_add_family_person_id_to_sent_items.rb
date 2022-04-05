class AddFamilyPersonIdToSentItems < ActiveRecord::Migration[6.1]
  def change
    add_column :sent_items, :family_person_id, :integer
  end
end
