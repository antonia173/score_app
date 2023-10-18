class CreateCompetitors < ActiveRecord::Migration[7.0]
  def change
    create_table :competitors do |t|
      t.references :competition, null: false, foreign_key: { on_delete: :cascade }
      t.string :name

      t.timestamps
    end
  end
end
