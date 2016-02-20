class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :last_name
      t.string :group

      t.timestamps null: false
    end
  end
end
