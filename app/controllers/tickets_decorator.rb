class TicketsDecorator
  def initialize(ticket)
    @ticket = ticket
  end

  def logs
    @ticket.logs.map(&:description)
  end

  def method_missing(method, *args)
    if @ticket.respond_to?(method)
      @ticket.send(method, *args)
    else
      super
    end
  end
end
