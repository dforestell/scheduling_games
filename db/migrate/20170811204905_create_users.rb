class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :full_name, null: false
  		t.string :email, null: false
  		t.string :team_name, null: false
  		t.string :password_hash, null: false

  		t.timestamps
  	end
  end
end
