require "test_helper"

class TicketTest < ActiveSupport::TestCase
  test "Blank ticket cannot be saved" do
    ticket = Ticket.new

    assert !ticket.save, "Saved a blank ticket"
  end

  test "Cannot save ticket without a descripton" do
    invalid_ticket = Ticket.create(status: "invalid")
    valid_ticket = Ticket.create(description: "valid", pr_url: "http://isaurl.com")

    assert !invalid_ticket.valid?, "Saved a ticket without a description"
    assert valid_ticket.valid?, "Failed to save a ticket with only description"
  end

  test "Cannot save ticket without a valid pr_url" do
    invalid_ticket = Ticket.create(description: "invalid", pr_url: "not-a-url")
    valid_ticket = Ticket.create(description: "valid", pr_url: "http://isaurl.com")

    assert !invalid_ticket.valid?, "Saved a ticket with a bad URL"
    assert valid_ticket.valid?, "Failed to save a ticket a good URL"
  end
end
