class AddIsDeletedToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :is_deleted, :boolean, default: false
  end
end
