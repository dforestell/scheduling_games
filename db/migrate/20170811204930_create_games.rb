class CreateGames < ActiveRecord::Migration
  def change
  	create_table :games do |t|
  		t.time :time, null: false
  		t.date :date, null: false
  		t.string :field_address, null: false
  		t.integer :host_id, null: false
  		t.integer :traveler_id

  		t.timestamps
  	end
  end
end
