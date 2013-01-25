class CreateUserProfiles < ActiveRecord::Migration
  def change
    create_table :user_profiles do |t|
      t.references :user
      t.string :user_name, :null => false
      t.string :address, :null => false
      t.integer :mobile_number, :null => false
      t.string :company, :null => false
      t.timestamps
    end
  end
end
