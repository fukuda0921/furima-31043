class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|

      t.timestamps
      t.text :comment
      t.references :user, foreing_key: true
      t.references :item, foreing_key: true
    end
  end
end
