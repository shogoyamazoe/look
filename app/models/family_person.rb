class FamilyPerson < ApplicationRecord
  has_many :give_items, dependent: :destroy
  has_many :sent_items, dependent: :destroy

  validates :family_person, presence: true

   def have_family_person?
    give_items.exists?
  end

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
