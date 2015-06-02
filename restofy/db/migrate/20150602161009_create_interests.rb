class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
    	t.belongs_to :profile
   		t.belongs_to :cuisine
    	
    end
  end
end
