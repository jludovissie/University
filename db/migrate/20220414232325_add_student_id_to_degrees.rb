class AddStudentIdToDegrees < ActiveRecord::Migration[6.1]
  def change
    add_column :degrees, :student_number, :int
  end
end
