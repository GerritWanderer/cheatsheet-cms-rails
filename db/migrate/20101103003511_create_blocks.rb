class CreateBlocks < ActiveRecord::Migration
  def self.up
    create_table :blocks do |t|
      t.string :name
      t.integer :position
      t.string :template
      t.text :content
      t.references :cheat

      t.timestamps
    end
  end

  def self.down
    drop_table :blocks
  end
end
