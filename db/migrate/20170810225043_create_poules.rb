class CreatePoules < ActiveRecord::Migration
  def change
    create_table :poules do |t|
      t.string :name
    end
  end
end
