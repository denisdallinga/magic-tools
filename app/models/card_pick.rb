class CardPick < ActiveRecord::Base

  belongs_to :player, through: :picked_by
  belongs_to :poule
  belongs_to :card

end
