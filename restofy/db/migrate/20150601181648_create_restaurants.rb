class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.text :Name
    	t.integer :PermitID
    	t.text :Address
    	t.decimal :Lattitude
    	t.decimal :Longitude
    	t.text :YahooID
    	
    	t.timestamps null: false
    end
  end
end
