class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :customer, null: false         #顧客への外部キー
      t.string :type, null: false                 #継承カラム
      t.string :postal_code, null: false
      t.string :prefecture, null: false
      t.string :city, null: false
      t.string :address1, null: false
      t.string :address2, null: false
      t.string :company_name, null: false, default: ''
      t.string :division_name, null: false, default: ''

      t.timestamps
    end

    add_index :addresses, :customer_id
    add_index :addresses, [ :type, :customer_id ], unique: true
    add_foreign_key :addresses, :customers
  end
end
