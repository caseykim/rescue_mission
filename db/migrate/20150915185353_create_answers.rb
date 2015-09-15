class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.string :description, null: false
      t.belongs_to :question, null: false
      t.timestamps
    end

    add_index :answers, :question_id
    add_index :answers, :description, unique: true
  end
end
