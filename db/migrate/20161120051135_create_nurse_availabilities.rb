class CreateNurseAvailabilities < ActiveRecord::Migration
  def change
    create_table :nurse_availabilities do |t|
    	t.integer :nurse_id
    	t.date :available_date
    	t.time :available_time1
    	t.time :available_time2
    	t.time :available_time3
    	t.time :available_time4
    	t.time :available_time5
      t.timestamps null: false
    end
  end
end
