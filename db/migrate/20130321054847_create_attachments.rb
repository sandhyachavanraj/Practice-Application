class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :email
      t.string :file_name
      t.string :content_type
      t.integer :file_size
      t.timestamps
    end
  end
end
