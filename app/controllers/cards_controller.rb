class CardsController < ApplicationController

  before_filter :check_user

  def show
    @card = Card.find(params[:id])
  end

end
