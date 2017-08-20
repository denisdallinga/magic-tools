class PlayersController < ApplicationController

  before_filter :check_user

  def roll_dice
    Player.find(params[:id]).roll_dice

    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

end
