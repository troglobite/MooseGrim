class Ticket < ApplicationRecord
  validates :title, :status, :update, presence: true
end
