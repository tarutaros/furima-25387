class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :load
  belongs_to :area
  belongs_to :days

  with_options presence: true do
    validates :image
    validates :name
    validates :text
  end

  validates :price, presence: true  
  validates :price, numericality:{with: /\A[0-9]+\z/, message: 'is invalid. Input half-width characters'}
  validates :price, numericality: {greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range'}

  with_options presence: true, numericality: {other_than: 1, message: "can't be blank"} do
    validates :category_id
    validates :status_id
    validates :load_id
    validates :delivery_area_id
    validates :delivery_days_id
  end
end
