class CreateReports < ActiveRecord::Migration[7.0]
  def change
    create_table :reports do |t|
      t.references :player, null: false, foreign_key: true
      t.references :scout, null: false, foreign_key: true
      t.text :summary
      t.string :reportable_type
      t.bigint :reportable_id, null: false

      t.timestamps
    end
  end
end
