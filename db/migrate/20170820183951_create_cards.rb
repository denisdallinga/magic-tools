class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :card_name
      t.string :rarity
      t.string :image_url
    end
  end
end
