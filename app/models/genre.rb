class Genre < ApplicationRecord
  has_many :give_items, dependent: :destroy
  has_many :sent_items, dependent: :destroy
  has_many :give_returns, through: :give_items
  has_many :sent_returns, through: :sent_items

  validates :genre, presence: true
end
