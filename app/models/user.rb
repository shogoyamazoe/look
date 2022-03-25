class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :give_items, dependent: :destroy
  has_many :give_returns, dependent: :destroy
  has_many :sent_items, dependent: :destroy
  has_many :sent_returns, dependent: :destroy
end
