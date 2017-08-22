class PoulesController < ApplicationController

  before_filter :check_user

  def show
    @poule = Poule.find params[:id]
  end

  def show_available_picks
    @poule = Poule.find params[:id]
    @card_picks = @poule.card_picks.not_picked.with_cards.order("cards.card_name ASC")
    if params[:rarity]
      @card_picks = @card_picks.where('cards.rarity = ?', params[:rarity])
    end
  end

end
