class GiveItem < ApplicationRecord
  has_many :give_returns, dependent: :destroy
  belongs_to :give_person
  belongs_to :family_person
  belongs_to :user
  belongs_to :genre
end
