class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
    	t.integer :patient_id
    	t.time :preferred_time
    	t.date :preferred_date
    	t.string :preferred_location
    	t.integer :service_id
      t.timestamps null: false
    end
  end
end
