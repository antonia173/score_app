class Competitor < ApplicationRecord
  belongs_to :competition
  has_many :standings

  validates :name, presence: true

  def matches
    Match.where(competitor1_id: id) + Match.where(competitor2_id: id)
  end

  def update_points
    w = wins
    l = losses
    d = draws
    total_points = (competition.win * w) + (competition.draw * d) + (competition.loss * l)

    
    standing = standings.find_or_create_by(competition: competition, competitor: self)
    standing.update(points: total_points, wins: w, losses: l, draws: d)
  end

  private

  def wins
    matches.select { |match| match.winner == self }.count 
  end

  def losses
    matches.select { |match| !match.winner.nil? && match.winner != self && match.winner != 'draw'}.count 
  end

  def draws
    matches.select { |match| match.winner == 'draw' }.count 
  end
end