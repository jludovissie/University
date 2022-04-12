class CreateCourseStudents < ActiveRecord::Migration[6.1]
  def change
    create_table :course_students do |t|
      t.references :student, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
