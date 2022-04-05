class GiveReturn < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :give_item
  belongs_to :user
end
