class House < ApplicationRecord
  validates :location, presence: true
end
