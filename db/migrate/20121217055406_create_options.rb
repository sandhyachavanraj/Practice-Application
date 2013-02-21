class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.references :question
   	  t.string :label
   	  t.string :value
      t.timestamps
    end
  end
end
