class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.string :name
      t.integer :sender_id
      t.integer :receiver_id
#      t.string :sender_mail_id
#      t.string :receiver_mail_id
      t.string :subject
      t.text :body
      t.datetime :sent_at
      t.timestamps
    end
  end
end
