FactoryBot.define do
  factory :purchase_address do
    postal_code { '756-4446'}
    municipality { '福岡市博多区'}
    street_number { '5−4'}
    prefecture_id { 38 }
    building_name {'博多ビル'}
    telephone_number { 85768473648 }
  end
end
