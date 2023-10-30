class AddUserIdToCompetitions < ActiveRecord::Migration[7.0]
  def change
    add_reference :competitions, :user, foreign_key: true
  end
end
