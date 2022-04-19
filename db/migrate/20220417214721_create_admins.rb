class CreateAdmins < ActiveRecord::Migration[6.1]
  def change
    create_table :admins do |t|
      t.string :name 
      t.string :phone 
      t.string :email 
      t.string :address 
      t.string :description 
      t.string :username
      t.timestamps
    end
  end
end
