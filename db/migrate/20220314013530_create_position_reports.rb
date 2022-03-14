class CreatePositionReports < ActiveRecord::Migration[7.0]
  def change
    create_table :position_reports do |t|
      t.string :position
      t.integer :batting_grade
      t.decimal :running_time

      t.timestamps
    end
  end
end
