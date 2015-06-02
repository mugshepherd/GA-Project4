class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
    	t.belongs_to :profile

    	t.text :interests
    end
  end
end
