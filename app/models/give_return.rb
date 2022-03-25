class GiveReturn < ApplicationRecord
  belongs_to :give_item
  belongs_to :user
end
