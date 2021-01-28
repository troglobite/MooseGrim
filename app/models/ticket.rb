class Ticket < ApplicationRecord
  validates :description, presence: true
end
