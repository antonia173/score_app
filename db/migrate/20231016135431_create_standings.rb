class CreateStandings < ActiveRecord::Migration[7.0]
  def change
    create_table :standings do |t|
      t.references :competition, null: false, foreign_key: { on_delete: :cascade }
      t.references :competitor, foreign_key: { to_table: :competitors }
      t.integer :points

      t.timestamps
    end
  end
end
