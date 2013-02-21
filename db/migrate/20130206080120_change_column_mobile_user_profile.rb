class ChangeColumnMobileUserProfile < ActiveRecord::Migration
  def up
  	change_column :user_profiles, :mobile_number, :string
  end

  def down
  end
end