class AddAttachmentPhotoToUserProfiles < ActiveRecord::Migration
  def self.up
    change_table :user_profiles do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :user_profiles, :photo
  end
end
