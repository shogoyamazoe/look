class FamilyPerson < ApplicationRecord
  has_many :give_items, dependent: :destroy
end
