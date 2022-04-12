class CreateClasses < ActiveRecord::Migration[6.1]
  def change
    create_table :classes do |t|
      t.string :class_name
      t.string :class_number 
      t.string :class_professor 
      t.timestamps
    end
  end
end
