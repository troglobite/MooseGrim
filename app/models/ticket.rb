class Ticket < ApplicationRecord
  validates :description, presence: true
  validates_format_of :pr_url,
    :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,63}(:[0-9]{1,5})?(\/.*)?\z/ix,
    allow_blank: true,
    message: "not a valid URL"

  STATUSES = [
    "product_backlog",
    "ready_for_development",
    "in_development",
    "blocked",
    "in_review",
    "in_qa",
    "returned_to_developement",
    "ready_for_deploy",
    "deployed"
  ]
end
