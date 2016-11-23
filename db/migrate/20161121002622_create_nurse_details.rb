class CreateNurseDetails < ActiveRecord::Migration
  def change
    create_table :nurse_details do |t|
    	t.integer :nurse_id
    	t.integer :service_id
      t.timestamps null: false
    end
  end
end
