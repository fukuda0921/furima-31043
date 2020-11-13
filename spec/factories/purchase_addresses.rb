FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    postal_code { '756-4446' }
    municipality { '福岡市博多区' }
    street_number { '5−4' }
    prefecture_id { 38 }
    building_name { '博多ビル' }
    telephone_number { 85_768_473_648 }
  end
end
