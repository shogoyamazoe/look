class FamilyPerson < ApplicationRecord
  has_many :give_items, dependent: :destroy
  has_many :sent_items, dependent: :destroy
end
