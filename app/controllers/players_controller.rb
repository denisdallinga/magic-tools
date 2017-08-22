class PlayersController < ApplicationController

  before_filter :check_user

  def roll_dice
    Player.find(params[:id]).roll_dice

    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def pick_card
    @player = Player.find(params[:id])
    poule = @player.poule
    raise "This player is not allowed to make a pick" unless @player = poule.player_thats_allowed_to_pick

    @card_picks = poule.card_picks.not_picked.with_cards
    if params[:rarity]
      @card_picks = @card_picks.where('cards.rarity = ?', params[:rarity])
    end
  end

  def do_pick
    player = Player.find(params[:id])
    card_pick = CardPick.find(params[:card_pick_id])
    raise "This card already has been picked" unless card_pick.player.nil?
    card_pick.player = player
    card_pick.save!

    redirect_to controller: :poules, action: :show, id: player.poule.id
  end

end
