class CreateDegrees < ActiveRecord::Migration[6.1]
  def change
    create_table :degrees do |t|
      t.string :department 
      t.string :major 
      t.timestamps
    end
  end
end
