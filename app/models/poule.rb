class Poule < ActiveRecord::Base

  has_many :players
  has_many :dice_roll_rounds

  before_create :set_initial_state

  INITIALIZED = 0
  DICE_ROLL_STARTED = 1
  CARD_PICK_STARTED = 2

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
    when Poule::CARD_PICK_STARTED
      return 'Card pick started'
    else
      return 'Unknown state'
    end
  end

  def compute_and_progress_state
    if self.state == Poule::DICE_ROLL_STARTED
      self.dice_roll_rounds.each do |dice_roll_round|
        return true if not dice_roll_round.round_finished?
      end
      self.state = Poule::CARD_PICK_STARTED
    end

    save!
  end

end
