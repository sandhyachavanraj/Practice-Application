class AddStatusOfAnswerToAnswer < ActiveRecord::Migration
  def change
    add_column :answers, :status_of_answer, :boolean, default: false
  end
end
