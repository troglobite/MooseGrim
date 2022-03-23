class TicketsDecorator
  def initialize(ticket)
    @ticket = ticket
  end

  def logs
    @ticket.logs.map(&:description)
  end
end
