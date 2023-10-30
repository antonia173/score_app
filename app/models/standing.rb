class Standing < ApplicationRecord
  belongs_to :competition
  belongs_to :competitor
end
