class Log < ApplicationRecord
  def date
    created_at.to_date
  end
end
