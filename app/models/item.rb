class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category 
  belongs_to :status 
  belongs_to :delivery_fee 
  belongs_to :prefecture
  belongs_to :days_to_ship

    with_options presence: true do
      validates :name
      validates :explanation
      validates :price
    end
    validates :category, numericality: { other_than: 1 }
    validates :status_id, numericality: { other_than: 1 }
    validates :delivery_fee_id, numericality: { other_than: 1 }
    validates :prefecture_id, numericality: { other_than: 0 }
    validates :days_to_ship_id, numericality: { other_than: 1 }
end
