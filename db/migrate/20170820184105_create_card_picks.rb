class CreateCardPicks < ActiveRecord::Migration
  def change
    create_table :card_picks do |t|
      t.integer :picked_by
      t.integer :card_id
      t.integer :poule_id
    end
  end
end
