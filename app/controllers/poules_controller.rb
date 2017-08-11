class PoulesController < ApplicationController

  before_filter :check_user

  def show
    @poule = Poule.find params[:id]
  end

end
