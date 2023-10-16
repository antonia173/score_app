class Competitor < ApplicationRecord
  belongs_to :competition
  has_many :standings

  validates :name, presence: true

  def matches
    Match.where(competitor1_id: id) + Match.where(competitor2_id: id)
  end

  def update_points
    total_points = calculate_points

    standing = standings.find_or_create_by(competition: competition, competitor: self)
    standing.update(points: total_points)
  end

  private

  def calculate_points
    (competition.win * wins) + (competitions.draw * draws) + (competitions.loss * losses)
  end

  def wins
    matches.select { |match| match.winner == self }.count 
  end

  def losses
    matches.select { |match| match.loser == self }.count 
  end

  def draws
    matches.select { |match| match.winner == 'draw' }.count 
  end
end