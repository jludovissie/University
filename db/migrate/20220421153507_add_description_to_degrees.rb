class AddDescriptionToDegrees < ActiveRecord::Migration[6.1]
  def change
    add_column :degrees, :description, :text 
  end
end
