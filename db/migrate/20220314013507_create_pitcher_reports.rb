class CreatePitcherReports < ActiveRecord::Migration[7.0]
  def change
    create_table :pitcher_reports do |t|
      t.string :role

      t.timestamps
    end
  end
end
