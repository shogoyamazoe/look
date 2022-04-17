class SentPerson < ApplicationRecord
  has_many :sent_items, dependent: :destroy

  validates :sent_person, presence: true
  validates :involvement, presence: true
end
