class CreatePotentialViolations < ActiveRecord::Migration
  def change
    create_table :potential_violations do |t|
      t.text :ViolationNumber
      t.text :ViolationDescription
      t.text :ViolationCategory

      t.timestamps null: false
    end
  end
end
