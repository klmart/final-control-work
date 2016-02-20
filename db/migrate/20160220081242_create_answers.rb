class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.boolean :answer_status, default: false

      t.timestamps null: false
    end
  end
end
