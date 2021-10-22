class HistoryDestination
  include ActiveModel::Model
  attr_accessor :post_code, :delivery_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  validates :post_code, presence: true
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows(e.g. 123-4567)"}

  with_options presence: true do
    validates :delivery_area_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address
    validates :item_id
    validates :user_id
    validates :token
  end
  
  validates :phone_number, presence: true
  validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "is too short"}
  validates :phone_number, format: {with: /\A\d[0-9]+\z/, message: "is invalid. Input only number"}
  
  def save
    items_history = ItemsHistory.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, delivery_area_id: delivery_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, items_history: items_history)
  end
end