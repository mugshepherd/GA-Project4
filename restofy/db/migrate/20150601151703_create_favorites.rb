class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
    	t.belongs_to :profile

    	t.text :location
    end
  end
end
