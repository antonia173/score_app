class Competition < ApplicationRecord
  belongs_to :user
  has_many :competitors, dependent: :destroy
  has_many :matches, dependent: :destroy
  has_many :standings, dependent: :destroy

  validates :name, presence: true
  validates :win, presence: true
  validates :draw, presence: true
  validates :loss, presence: true

end