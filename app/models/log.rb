class Log < ApplicationRecord
  belongs_to :ticket
  def date
    created_at.to_date
  end
end
