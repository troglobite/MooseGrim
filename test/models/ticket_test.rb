require "test_helper"

class TicketTest < ActiveSupport::TestCase
  test "Blank ticket cannot be saved" do
    ticket = Ticket.new

    assert !ticket.save, "Saved a blank ticket"
  end

  test "Cannot save ticket without a descripton" do
    invalid_ticket = Ticket.create(status: "invalid")
    valid_ticket = Ticket.create(description: "valid")

    assert !invalid_ticket.save, "Saved a ticket without a description"
    assert valid_ticket.save, "Failed to save a ticket with only description"
  end
end
