class CreateDiceRollRounds < ActiveRecord::Migration
  def change
    create_table :dice_roll_rounds do |t|
      t.integer :poule_id
      t.json    :state
      t.boolean :round_finished
    end
  end
end
