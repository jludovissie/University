class CreateClassStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :class_students do |t|
      t.integer :student_id 
      t.integer :class_id  
      t.timestamps
    end
  end
end
