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
    competitor1.update_points
    competitor2.update_points
  end
end
