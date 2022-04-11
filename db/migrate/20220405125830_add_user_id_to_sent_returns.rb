class AddUserIdToSentReturns < ActiveRecord::Migration[6.1]
  def change
    add_column :sent_returns, :user_id, :integer
  end
end
