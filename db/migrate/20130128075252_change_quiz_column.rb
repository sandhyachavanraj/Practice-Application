class ChangeQuizColumn < ActiveRecord::Migration
  def up
  	rename_column :quizzes, :assigns_to, :created_by
  end

  def down
  end
end
