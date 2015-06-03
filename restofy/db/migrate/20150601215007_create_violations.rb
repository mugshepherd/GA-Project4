class CreateViolations < ActiveRecord::Migration
  def change
    create_table :violations do |t|
      t.belongs_to :inspection, index: true, foreign_key: true
      t.belongs_to :potential_violation, index: true, foreign_key: true
      t.text :violation_text

      t.timestamps null: false
    end
  end
end
