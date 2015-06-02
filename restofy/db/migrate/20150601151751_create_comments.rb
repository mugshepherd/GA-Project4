class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.belongs_to :profile

    	t.text :content
    	t.timestamps :date_taken 
    end
  end
end
