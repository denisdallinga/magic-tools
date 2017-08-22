class CardPick < ActiveRecord::Base

  belongs_to :player, foreign_key: :picked_by
  belongs_to :poule
  belongs_to :card

  scope :not_picked, -> { where('picked_by IS NULL') }
  scope :with_cards, -> { joins('JOIN cards ON card_picks.card_id = cards.id') }
end
