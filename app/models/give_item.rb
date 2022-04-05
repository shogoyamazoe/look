class GiveItem < ApplicationRecord

  mount_uploader :image, ImageUploader

  has_many :give_returns, dependent: :destroy
  belongs_to :give_person
  belongs_to :family_person
  belongs_to :user
  belongs_to :genre

  def have_return?
    give_returns.exists?
  end
end
