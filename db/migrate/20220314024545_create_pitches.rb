class CreatePitches < ActiveRecord::Migration[7.0]
  def change
    create_table :pitches do |t|
      t.string :pitch_type
      t.integer :velocity_high
      t.integer :velocity_low
      t.references :pitcher_report, null: false, foreign_key: true

      t.timestamps
    end
  end
end
