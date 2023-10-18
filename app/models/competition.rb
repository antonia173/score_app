class Competition < ApplicationRecord
  has_many :competitors, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :standings, dependent: :destroy

  validates :name, presence: true
  validates :win, presence: true
  validates :draw, presence: true
  validates :loss, presence: true


  def generate_schedule(competitors)
    rounds_4 = [
      [[1, 4], [2, 3]],
      [[2, 4], [3, 1]],
      [[3, 4], [1, 2]]
    ]

    round_6 = [
      [[1, 6], [2, 5], [3, 4]],
      [[2, 6], [3, 1], [4, 5]],
      [[3, 6], [4, 2], [5, 1]],
      [[4, 5], [5, 3], [1, 2]],
      [[5, 6], [1, 4], [2, 3]]
    ]

    round_8 = [
      [[1, 8], [2, 7], [3, 6], [4, 5]],
      [[2, 8], [3, 1], [4, 7], [5, 6]],
      [[3, 8], [4, 2], [5, 1], [6, 7]],
      [[4, 8], [5, 3], [6, 2], [7, 1]],
      [[5, 8], [6, 4], [7, 3], [1, 2]],
      [[6, 8], [7, 5], [1, 4], [2, 3]],
      [[7, 8], [1, 6], [2, 5], [3, 4]]
    ]
  end
end