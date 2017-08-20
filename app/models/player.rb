
class Player < ActiveRecord::Base

  belongs_to :user
  belongs_to :poule

  def roll_dice
    poule.add_dice_roll(self.id, SecureRandom.random_number(20) +1)
  end

end
