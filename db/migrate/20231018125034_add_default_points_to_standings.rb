class AddDefaultPointsToStandings < ActiveRecord::Migration[7.0]
  def change
    change_column :standings, :points, :integer, default: 0
  end
end
