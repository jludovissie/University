class DropClassStudents < ActiveRecord::Migration[6.1]
  def change
    drop_table :class_students
  end
end
