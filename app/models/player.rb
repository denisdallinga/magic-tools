
class Player < ActiveRecord::Base

  belongs_to :user
  belongs_to :poule
  has_many :card_picks, foreign_key: :picked_by

  def roll_dice
    poule.add_dice_roll(self.id, SecureRandom.random_number(20) +1)
  end

end
