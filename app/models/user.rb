class User < ApplicationRecord
  has_many :competitions

  validates :email, uniqueness: { case_sensitive: false }
end