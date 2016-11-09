class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string :last_name
    	t.string :email
    	t.string :username
    	t.string :password
    	t.string :gender
    	t.string :language
    	t.string :address
    	t.string :status
      t.string :role
      t.timestamps null: false
    end
  end
end
