class AddReatAtToEmail < ActiveRecord::Migration
  def change
    add_column :emails, :read_at, :datetime
    add_column :emails, :is_drafted, :boolean, default: false
  end
end
