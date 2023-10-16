class Competition < ApplicationRecord
  has_many :competitors
  has_many :matches
  has_many :standings

  validates :name, presence: true
  validates :win, presence: true
  validates :draw, presence: true
  validates :loss, presence: true
end