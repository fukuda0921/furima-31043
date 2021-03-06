class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_one :purchase
  has_many :comments

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :delivery_fee
  belongs_to :prefecture
  belongs_to :days_to_ship

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
  end
  validates :price, numericality: { only_integer: true, with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price, inclusion: { in: 300..9_999_999, message: 'Out of setting range' }
  validates :prefecture_id, numericality: { other_than: 0, message: 'Select' }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :delivery_fee_id
    validates :days_to_ship_id
  end
end
