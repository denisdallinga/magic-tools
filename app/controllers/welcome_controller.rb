class WelcomeController < ApplicationController

  before_filter :check_user

  # GET /welcome
  def index
    @poules = Poule.all.order(:id)
  end

end
