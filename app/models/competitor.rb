class Competitor < ApplicationRecord
  belongs_to :competition
  has_many :standings

  validates :name, presence: true

  def matches
    Match.where(competitor1_id: id) + Match.where(competitor2_id: id)
  end
end