class AddPermissionsToAdmins < ActiveRecord::Migration[6.1]
  def change
   add_column :admins, :admin, :boolean, default: yes
  end
end
