class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
    	t.text :Name
    	t.integer :PermitID
    	t.text :Address
    	t.decimal :Latitude
    	t.decimal :Longitude
    	
    	t.timestamps null: false
    end
  end
end
