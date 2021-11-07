class HistoryDestination
  include ActiveModel::Model
  attr_accessor :post_code, :delivery_area_id, :city, :address, :building_name, :phone_number, :user_id, :item_id, :token

  validates :post_code, presence: true
  validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は無効です. 次のように入力してください(例. 123-4567)"}

  with_options presence: true do
    validates :delivery_area_id, numericality: {other_than: 1, message: "を入力してください"}
    validates :city
    validates :address
    validates :item_id
    validates :user_id
    validates :token
  end
  
  validates :phone_number, presence: true
  validates :phone_number, format: {with: /\A\d{10}\z|\A\d{11}\z/, message: "が短いです"}
  validates :phone_number, format: {with: /\A\d[0-9]+\z/, message: "は無効です. 数字で入力してください"}
  
  def save
    items_history = ItemsHistory.create(user_id: user_id, item_id: item_id)
    Destination.create(post_code: post_code, delivery_area_id: delivery_area_id, city: city, address: address, building_name: building_name, phone_number: phone_number, items_history_id: items_history.id)
  end
end