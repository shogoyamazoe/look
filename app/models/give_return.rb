class GiveReturn < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :give_item
  belongs_to :user
  belongs_to :genre

  validates :product, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  validates :return_day, presence: true
end
