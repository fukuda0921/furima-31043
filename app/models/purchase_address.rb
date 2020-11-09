class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :municipality, :street_number, :building_name, :telephone_number, :purchase_id

 with_options presence: true do
  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message:"Input correctly"}
  validates :municipality
  validates :street_number
  validates :telephone_number, format: { with: /\A\d[0-9]{,11}\z/, message:"Input only number"}
 end
 validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }
 
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, municipality: municipality, street_number: street_number, building_name: building_name, telephone_number: telephone_number, purchase_id: purchase.id)
   
  end
end
