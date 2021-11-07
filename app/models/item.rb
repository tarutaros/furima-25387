class Item < ApplicationRecord
  belongs_to :user
  has_one :items_history, dependent: :destroy
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :load
  belongs_to :delivery_area
  belongs_to :delivery_days

  with_options presence: true do
    validates :image
    validates :name
    validates :text
  end

  validates :price, presence: true  
  validates :price, numericality:{with: /\A[0-9]+\z/, message: 'は無効です. 半角数字で入力してください'}
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'が範囲外の値です'}

  with_options presence: true, numericality: {other_than: 1, message: "を選択してください"} do
    validates :category_id
    validates :status_id
    validates :load_id
    validates :delivery_area_id
    validates :delivery_days_id
  end
end
