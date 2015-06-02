class CreateInspections < ActiveRecord::Migration
  def change
    create_table :inspections do |t|
      t.integer :InspectionID
      t.references :PermitID, index: true, foreign_key: true
      t.date :Date
      t.time :Time
      t.text :InspectionType
      t.integer :CriticalViolations
      t.integer :NonCriticalViolations
      t.integer :CriticalViolationsCorrectedOnSite
      t.integer :CriticalViolationsToBeResolved
      t.integer :NonCriticalViolationsCorrectedOnSite
      t.integer :NonCriticalViolationsToBeResolved

      t.timestamps null: false
    end
  end
end
