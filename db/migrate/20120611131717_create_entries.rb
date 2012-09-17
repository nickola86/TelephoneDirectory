class CreateEntries < ActiveRecord::Migration
  def self.up
    create_table :entries do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :number, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :entries
  end
end
