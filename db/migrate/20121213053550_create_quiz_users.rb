class CreateQuizUsers < ActiveRecord::Migration
  def change
    create_table :quiz_users do |t|
      t.references :quiz
      t.references :user
      t.integer :score, :default => 0
      t.time :starting_time
      t.time :ending_time
      t.timestamps
    end
  end
end
