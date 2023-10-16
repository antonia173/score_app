class CreateCompetitors < ActiveRecord::Migration[7.0]
  def change
    create_table :competitors do |t|
      t.references :competition, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
