class AddAttributesToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :name, :text 
    add_column :students, :age, :text 
    add_column :students, :act_score, :int 
    add_column :students, :gpa, :int 
    add_column :students, :extra_curricular, :text
  end
end
