require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品の出品がうまくいくとき' do
      it "nameとtext,category_id,status_id,load_id,delivery_area_id,delivery_days_id,priceが存在すれば登録できる" do
        expect(@item).to be_valid
      end
    end

    context '商品の出品がうまくいかないとき' do
      it "imageが空だと出品できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it "nameが空だと出品できない" do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it "textが空だと出品できない" do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end
      it "category_idが未選択だと出品できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it "status_idが未選択だと出品できない" do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it "load_idが未選択だと出品できない" do
        @item.load_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it "delivery_area_idが未選択だと出品できない" do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it "delivery_days_idが未選択だと出品できない" do
        @item.delivery_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it "priceが空だと出品できない" do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格を入力してください")
      end
      it "priceが全角数字だと出品できない" do
        @item.price = '２０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は無効です. 半角数字で入力してください")
      end
      it "priceが299円以下だと出品できない" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格が範囲外の値です")
      end
      it "priceが9,999,999円以上だと出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格が範囲外の値です")
      end
      it 'priceが英字では保存できない' do
        @item.price = 'aaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は無効です. 半角数字で入力してください")
      end
      it 'priceが英数字混合では保存できない' do
        @item.price = 'aaa999'
        @item.valid?
        expect(@item.errors.full_messages).to include("販売価格は無効です. 半角数字で入力してください")
      end
      it "userが紐づいていなければ出品できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
