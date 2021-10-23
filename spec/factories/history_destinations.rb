FactoryBot.define do
  factory :history_destination do
    token {'tok_abcdefghijk00000000000000000'}
    post_code {'175-0092'}
    delivery_area_id {9}
    city {'横浜市'}
    address {'青山1-1'}
    building_name {'バベルの塔201号室'}
    phone_number {'08012345678'}
  end
end
