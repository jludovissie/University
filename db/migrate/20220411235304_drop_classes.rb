class DropClasses < ActiveRecord::Migration[6.1]
  def change
    drop_table :classes
  end
end
