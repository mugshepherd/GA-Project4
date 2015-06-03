class CreatePotentialViolations < ActiveRecord::Migration
  def change
    create_table :potential_violations do |t|
      t.text :violation_number
      t.text :violation_description
      t.text :violation_category

      t.timestamps null: false
    end
  end
end
