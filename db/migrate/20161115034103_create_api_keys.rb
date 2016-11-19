class CreateApiKeys < ActiveRecord::Migration
  def change
    create_table :api_keys do |t|
    	t.integer :user_id
      t.string :access_token
      t.string :scope
      t.datetime :expired_at
      t.timestamps
      t.timestamps null: false
    end
  end
end
