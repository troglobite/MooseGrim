class Ticket < ApplicationRecord
  validates :description, presence: true
  validates_format_of :pr_url,
    :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(\/.*)?\z/ix,
    allow_blank: true,
    message: "not a valid URL"
end
