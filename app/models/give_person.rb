class GivePerson < ApplicationRecord
  has_many :give_items, dependent: :destroy
end
