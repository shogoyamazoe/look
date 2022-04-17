class SentReturn < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :sent_item
  belongs_to :user

  validates :product, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :return_day, presence: true
end
