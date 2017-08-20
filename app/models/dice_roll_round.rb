
class DiceRollRound < ActiveRecord::Base

  belongs_to :poule

  before_save :compute_state_and_assign_positions

  #     {
  #       dice_rolls: {1: 1, 2: 2},
  #       positions_to_give_away: [ 1, 2 ]
  #     },
  def self.create_from_players_and_positions_to_give_away!(players, positions_to_give_away)
    DiceRollRound.create!(state: {
        "dice_rolls": Hash[players.map{ |p| ["#{p.id}", nil]}],
        "positions_to_give_away" => positions_to_give_away
      },
      round_finished: false
    )
  end

  def player_allowed_to_roll_dice?(player_id)
    if self.state["dice_rolls"].keys.any? { |k| k == "#{player_id}"}
       return true if self.state["dice_rolls"]["#{player_id}"].nil?
    end

    false
  end

  def add_dice_roll!(player_id, number)
    raise 'This player is not allowed to roll a dice in this round' if not player_allowed_to_roll_dice?(player_id)

    self.state["dice_rolls"]["#{player_id}"] = number
    save!
  end

  def dice_roll(player_id)
    self.state["dice_rolls"]["#{player_id}"]
  end

  def compute_state_and_assign_positions
    self.state["dice_rolls"].each do |k,v|
      return if v.nil?
    end

    rolls = {}
    self.state["dice_rolls"].each do |k,v|
      if rolls[v].present?
        rolls[v] << k
      else
        rolls[v] = [k]
      end
    end

    rolls.keys.sort.each do |k|
      if rolls[k].count == 1
        position = self.state["positions_to_give_away"].delete(self.state["positions_to_give_away"].sort.last)
        player = Player.find(rolls[k].first)
        player.position = position
        player.save
      elsif rolls[k].count > 1
        players = Player.find(rolls[k])
        positions_to_give_away = self.state["positions_to_give_away"].sort.last(rolls[k].count).map do |p|
          self.state["positions_to_give_away"].delete(p)
        end
        new_dice_roll_round = DiceRollRound.create_from_players_and_positions_to_give_away!(players, positions_to_give_away)
        new_dice_roll_round.poule = self.poule
        new_dice_roll_round.save!
      else
        raise 'Should not happen'
      end
    end

    self.round_finished = true
  end

end
