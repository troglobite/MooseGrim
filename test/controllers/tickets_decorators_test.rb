require "test_helper"

class TicketsDecoratorTest < ActiveSupport::TestCase
  test "#logs" do
    decorated_ticket = TicketsDecorator.new(tickets(:valid))
    byebug
  end
end
