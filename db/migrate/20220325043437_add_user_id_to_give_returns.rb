class AddUserIdToGiveReturns < ActiveRecord::Migration[6.1]
  def change
    add_column :give_returns, :user_id, :integer
  end
end
