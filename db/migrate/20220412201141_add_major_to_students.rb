class AddMajorToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :major, :text 
  end
end
