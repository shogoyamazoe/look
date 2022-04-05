class SentItem < ApplicationRecord
  has_many :sent_returns, dependent: :destroy
  belongs_to :sent_person
  belongs_to :family_person
  belongs_to :user
  belongs_to :genre

  def have_return?
    sent_returns.exists?
  end
end
