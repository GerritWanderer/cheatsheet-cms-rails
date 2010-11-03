class ChangeBlocksToCategories < ActiveRecord::Migration
  def self.up
    drop_table :blocks
    drop_table :cheats
    
    create_table :categories do |t|
      t.string :name
      t.string :column
      t.integer :position
      t.references :sheet

      t.timestamps
    end
    create_table :cheats do |t|
      t.string :name
      t.string :preview
      t.integer :position
      t.references :category

      t.timestamps
    end
  end

  def self.down
    drop_table :categories
    drop_table :cheats
    create_table :blocks do |t|
      t.string :name
      t.string :column
      t.integer :position
      t.references :sheet

      t.timestamps
    end
    create_table :cheats do |t|
      t.string :name
      t.string :preview
      t.integer :position
      t.references :block

      t.timestamps
    end
  end
end