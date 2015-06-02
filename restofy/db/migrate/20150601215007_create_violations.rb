class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations do |t|
      t.references :InspectionID, index: true, foreign_key: true
      t.references :ViolationNumber, index: true, foreign_key: true
      t.text :ViolationText

      t.timestamps null: false
    end
  end
end
