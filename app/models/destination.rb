class Destination < ApplicationRecord
  belongs_to :items_history, dependent: :destroy

end
