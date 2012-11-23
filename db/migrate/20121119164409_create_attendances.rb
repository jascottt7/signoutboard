class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.boolean :out_of_office
      t.datetime :return_time
      t.string :reason
      t.string :comment
      t.integer :employee_id

      t.timestamps
    end
  end
end
