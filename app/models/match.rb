class Match < ApplicationRecord
  belongs_to :competition
  belongs_to :competitor1, class_name: 'Competitor', foreign_key: 'competitor1_id'
  belongs_to :competitor2, class_name: 'Competitor', foreign_key: 'competitor2_id'

  validates :competitor1_score, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :competitor2_score, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :datetime, presence: true

  after_save :update_standings

  def winner
    case
    when competitor1_score.nil? || competitor2_score.nil?
      nil
    when competitor1_score > competitor2_score
      competitor1
    when competitor2_score > competitor1_score
      competitor2
    else
      'draw'
    end
  end 

  def loser
    case
    when competitor1_score.nil? || competitor2_score.nil?
      nil
    when competitor1_score < competitor2_score
      competitor1
    when competitor2_score < competitor1_score
      competitor2
    else
      'draw'
    end
  end

  private

  def update_standings
    competitor1.update_points
    competitor2.update_points
  end
end
