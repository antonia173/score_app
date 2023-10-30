class AddWLDToStandings < ActiveRecord::Migration[7.0]
  def change
    add_column :standings, :wins, :integer, default: 0
    add_column :standings, :losses, :integer, default: 0
    add_column :standings, :draws, :integer, default: 0
  end
end
