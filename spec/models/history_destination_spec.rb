require 'rails_helper'

RSpec.describe HistoryDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @history_destination = FactoryBot.build(:history_destination, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入機能' do
    context 'ユーザーが購入できるとき' do
      it 'tokenとpost_code,delivery_area_id,city,address,phone_numberが存在すれば購入できる' do
        expect(@history_destination).to be_valid
      end
      it 'building_nameが空でも保存できる' do
        @history_destination.building_name = ''
        expect(@history_destination).to be_valid
      end
    end

    context 'ユーザーが購入できないとき' do
      it 'tokenが空だと購入できない' do
        @history_destination.token = nil
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("クレジットカード情報入力を入力してください")
      end
      it 'post_codeが空だと購入できない' do
        @history_destination.post_code = ''
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeが全角数字だと購入できない' do
        @history_destination.post_code = '１７５−００９２'
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("郵便番号は無効です. 次のように入力してください(例. 123-4567)")
      end
      it 'post_codeに半角ハイフンがないと購入できない' do
        @history_destination.post_code = '1750092'
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("郵便番号は無効です. 次のように入力してください(例. 123-4567)")
      end
      it 'delivery_area_idが未選択だと購入できない' do
        @history_destination.delivery_area_id = 1
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'addressが空だと購入できない' do
        @history_destination.address = ''
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("番地を入力してください")
      end
      it 'phone_numberが空だと購入できない' do
        @history_destination.phone_number = ''
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'phone_numberが短いと購入できない' do
        @history_destination.phone_number = '080336422'
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("電話番号が短いです")
      end
      it 'phone_numberが12ケタ以上だと購入できない' do
        @history_destination.phone_number = '080336422731'
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("電話番号が短いです")
      end
      it 'phone_numberが全角数字だと購入できない' do
        @history_destination.phone_number = '０８０３３６４２２７３'
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("電話番号は無効です. 数字で入力してください")
      end
      it 'userが紐づいていないと保存できない' do
        @history_destination.user_id = nil
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("Userを入力してください")
      end
      it 'itemが紐づいていないと保存できない' do
        @history_destination.item_id = nil
        @history_destination.valid?
        expect(@history_destination.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end