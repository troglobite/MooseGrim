class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    byebug
    @ticket = Ticket.new(ticket_params)

    if @ticket.valid?
      @ticket.save!
      flash[:notice] = "New ticket saved sucessfully"
      redirect_to tickets_path
    else
      flash.now[:error] = "Could not save ticket: #{@ticket.errors.messages}"
      render action: "new"
    end
  end

  def index
    @ticket = Ticket.new
    @tickets = Ticket.all
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :pr_url, :ticket_url, :status, :notes)
  end
end
