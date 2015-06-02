class CreatePotentialViolations < ActiveRecord::Migration
  def change
    create_table :violation_keys do |t|
      t.text :ViolationNumber
      t.text :ViolationDescription
      t.text :ViolationCategory

      t.timestamps null: false
    end
  end
end
