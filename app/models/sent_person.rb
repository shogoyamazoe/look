class SentPerson < ApplicationRecord
  has_many :sent_items, dependent: :destroy
end
