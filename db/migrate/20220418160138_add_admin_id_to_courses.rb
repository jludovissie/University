class AddAdminIdToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :admin_id, :int 
  end
end
