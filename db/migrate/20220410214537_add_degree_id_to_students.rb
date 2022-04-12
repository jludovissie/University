class AddDegreeIdToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :degree_id, :int 
  end
end
