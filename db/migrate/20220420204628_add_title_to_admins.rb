class AddTitleToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :title, :text 
  end
end
