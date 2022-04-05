class SentReturn < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :sent_item
end
