class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
    	t.belongs_to :user

    	t.text :name
    	t.text :photo_url
    	t.text :hometown
    	t.text :hobby
    	t.text :about_me
    	t.timestamps null: false
    end
  end
end
