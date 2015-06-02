class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.integer :inspection_id
      t.belongs_to :restaurant, index: true, foreign_key: true
      t.date :date
      t.time :time
      t.text :inspection_type
      t.integer :critical_violations
      t.integer :non_critical_violations
      t.integer :critical_violations_corrected_on_site
      t.integer :critical_violations_to_be_resolved
      t.integer :non_critical_violations_corrected_on_site
      t.integer :non_critical_violations_to_be_resolved

      t.timestamps null: false
    end
  end
end
