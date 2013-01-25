class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.references :question
      t.references :quiz_user
      t.string :value
      t.timestamps
    end
  end
end
