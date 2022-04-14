class SentItem < ApplicationRecord

  mount_uploader :image, ImageUploader

  has_many :sent_returns, dependent: :destroy
  belongs_to :sent_person
  belongs_to :family_person
  belongs_to :user
  belongs_to :genre

  def have_return?
    sent_returns.exists?
  end

  def first_array
    total_amount = 0
    sent_returns.map do |total|
      total_amount = total.price
    end
  end

  def total_price
    first_array.inject(:+)
  end
end
