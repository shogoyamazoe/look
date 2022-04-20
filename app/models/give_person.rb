class GivePerson < ApplicationRecord
  has_many :give_items, dependent: :destroy

  validates :give_person, presence: true
  validates :involvement, presence: true

  def third_array
    total_amount = 0
    give_items.map do |total|
      total_amount = total.price
    end
  end

  def second_total_price
    third_array.inject(:+)
  end
end
