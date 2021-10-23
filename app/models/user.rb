class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, dependent: :destroy
  has_many :items_histories

  with_options presence: true do
    validates :nickname
    validates :family_name, format: {with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: '全角文字を使用してください'}
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶー-龥々ー]+\z/, message: '全角文字を使用してください'}
    validates :family_name_kana, format: {with: /\A[ァ-ヶーー]+\z/, message: '全角文字を使用してください'}
    validates :first_name_kana, format: {with: /\A[ァ-ヶーー]+\z/, message: '全角文字を使用してください'}
    validates :birthday
  end
  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
  validates :password, format:{with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'  }
  
end
