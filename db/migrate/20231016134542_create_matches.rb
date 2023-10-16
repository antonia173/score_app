class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :competition, foreign_key: true
      t.references :competitor1, foreign_key: { to_table: :competitors }
      t.references :competitor2, foreign_key: { to_table: :competitors }
      t.integer :competitor1_score
      t.integer :competitor2_score
      t.datetime :datetime
      
      t.timestamps
    end
  end
end
