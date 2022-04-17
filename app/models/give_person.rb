class GivePerson < ApplicationRecord
  has_many :give_items, dependent: :destroy

  validates :give_person, presence: true
  validates :involvement, presence: true
end
