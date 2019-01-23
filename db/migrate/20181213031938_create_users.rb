class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :email, null:false, unique: true, index:true
      t.string :password_digest
      t.string :role, null:false, default: 'reseller'
      t.string :name, null:false
      t.string :phone
      t.text :address
      t.string :name_shop
      t.text :address_shop
      t.timestamps
    end
  end
end
