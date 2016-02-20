class CreateTestReports < ActiveRecord::Migration
  def change
    create_table :test_reports do |t|
      t.references :student, index: true, foreign_key: true
      t.references :test, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
