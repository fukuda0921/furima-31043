class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|

      t.timestamps
      t.string :postal_code
      t.integer :prefecture_id
      t.string :municipality
      t.string :street_number
      t.string :building_name
      t.string :telephone_number
      t.references :purchase, foreing_key: true
    end
  end
end
