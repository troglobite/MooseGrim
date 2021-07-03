class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.valid?
      @ticket.save!
      flash[:notice] = "New ticket saved sucessfully"
      redirect_to tickets_path
    else
      render json: { errors: @ticket.errors.messages, status: :internal_server_error }
    end
  end

  def index
    @tickets = Ticket.all
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :pr_url, :ticket_url, :status, :notes)
  end
end
