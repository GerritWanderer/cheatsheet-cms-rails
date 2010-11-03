class CreateCheats < ActiveRecord::Migration
  def self.up
    create_table :cheats do |t|
      t.string :name
      t.string :preview
      t.integer :position
      t.references :block

      t.timestamps
    end
  end

  def self.down
    drop_table :cheats
  end
end