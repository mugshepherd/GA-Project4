class CreateYelpReferences < ActiveRecord::Migration
  def change
    create_table :yelp_references do |t|
      t.references :PermitID, index: true, foreign_key: true
      t.string :YelpID

      t.timestamps null: false
    end
  end
end
