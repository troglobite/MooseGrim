class TicketsController < ApplicationController
  def new
    @ticket = Ticket.new

    respond_to do |format|
      format.js { render :new }
      format.html { render :new}
    end
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.valid?
      @ticket.save!
      flash[:notice] = "New ticket saved sucessfully"
      redirect_to tickets_path
    else
      render :new
    end
  end

  def index
    @tickets = Ticket.all
  end

  def edit
    @ticket = Ticket.find(ticket_params[:id])
  end

  def update
    @ticket = Ticket.find(ticket_params[:id])

    @ticket.assign_attributes(ticket_params)

    if @ticket.valid?
      @ticket.save!
      flash[:notice] = "New ticket saved sucessfully"
      redirect_to tickets_path
    else
      render :new
    end
  end

  private

  def ticket_params
    params.require(:ticket).permit(:description, :pr_url, :ticket_url, :status, :notes, :id)
  end
end
