class JournalController < ApplicationController
  def index
    @logs = Log.all
  end
end
