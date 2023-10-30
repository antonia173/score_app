class Match < ApplicationRecord
  belongs_to :competition
  belongs_to :competitor1, class_name: 'Competitor', foreign_key: 'competitor1_id'
  belongs_to :competitor2, class_name: 'Competitor', foreign_key: 'competitor2_id'

  validates :datetime, presence: true

  after_save :update_standings

  scope :from_round, ->(round_number) { where(round: round_number) }

  def winner
    return nil if competitor1_score.nil? || competitor2_score.nil?

    return competitor1 if competitor1_score > competitor2_score
    return competitor2 if competitor1_score < competitor2_score

    'draw'
  end 

  private

  def update_standings
    standing1 = Standing.find_or_create_by(competition: competition, competitor: competitor1)
    standing2 = Standing.find_or_create_by(competition: competition, competitor: competitor2)

    p_win = competition.win
    p_loss = competition.loss
    p_draw = competition.draw

    case winner
    when nil
      return
    when competitor1
      standing1.update(points: standing1.points + p_win)
      standing1.update(wins: standing1.wins + 1)
      standing2.update(points: standing2.points + p_loss)
      standing2.update(losses: standing2.losses + 1)
    when competitor2
      standing1.update(points: standing1.points + p_loss)
      standing1.update(losses: standing1.losses + 1)
      standing2.update(points: standing2.points + p_win)
      standing2.update(wins: standing2.wins + 1)
    when 'draw'
      standing1.update(points: standing1.points + p_draw)
      standing1.update(losses: standing1.draws + 1)
      standing2.update(points: standing2.points + p_draw)
      standing2.update(wins: standing2.draws + 1)
    end
  end
end
