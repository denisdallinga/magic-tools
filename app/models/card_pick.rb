class CardPick < ActiveRecord::Base

  belongs_to :player, foreign_key: :picked_by
  belongs_to :poule
  belongs_to :card

end
