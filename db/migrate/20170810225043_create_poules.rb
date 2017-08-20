class CreatePoules < ActiveRecord::Migration
  def change
    create_table :poules do |t|
      t.string  :name
      t.integer :state
    end
  end
end
