class Poule < ActiveRecord::Base

  has_many :players
  has_many :dice_roll_rounds

  before_create :set_initial_state

  INITIALIZED = 0
  DICE_ROLL_STARTED = 1

  def start_dice_roll!
    raise 'Dice roll already started!' if state >= DICE_ROLL_STARTED
    self.state = Poule::DICE_ROLL_STARTED

    self.dice_roll_rounds << DiceRollRound.create_from_players_and_positions_to_give_away!(self.players, self.players.count.times.map{ |i| i+1 } )
    save!
  end

  def set_initial_state
    self.state = Poule::INITIALIZED
  end

  def add_dice_roll(player_id, number)
    self.dice_roll_rounds.where(round_finished: false).each do |round|
      if round.player_allowed_to_roll_dice?(player_id)
        round.add_dice_roll!(player_id, number)
        return true
      end
    end

    raise "This user is not allowed to roll a dice in any round"
  end

  def state_to_s
    case self.state
    when Poule::INITIALIZED
      return 'Poule created, waiting for dice roll to start'
    when Poule::DICE_ROLL_STARTED
      return 'Dice roll has started'
    else
      return 'Unknown state'
    end
  end


end
