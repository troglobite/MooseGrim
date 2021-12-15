class LogsController < ApplicationController
  def new
    @ticket = Ticket.find(params[:ticket_id])
    @log = @ticket.logs.new
  end

  def create
    @log = Log.create(log_params)

    if @log.valid?
      @log.save!
      flash[:notice] = "New ticket log saved sucessfully"
      redirect_to tickets_path
    else
      render :new
    end
  end

  def index
  end

  def update
  end

  private

  def log_params
    params.permit(:description, :ticket_id)
  end
end
