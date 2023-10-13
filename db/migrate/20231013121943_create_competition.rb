class CreateCompetition < ActiveRecord::Migration[7.0]
  def change
    create_table :competitions do |t|
      t.string :name
      t.integer :win
      t.integer :draw
      t.integer :loss
      t.timestamps
    end
  end
end
