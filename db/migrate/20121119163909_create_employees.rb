class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :fname
      t.string :lname
      t.string :ext
      t.string :position
      t.string :cell_phone
      t.string :department
      t.string :branch_location
      t.string :supervisor

      t.timestamps
    end
  end
end
