class ItemsHistory < ApplicationRecord
  has_one :destination
  belongs_to :item
  belongs_to :user
end
