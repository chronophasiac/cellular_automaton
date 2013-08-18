class CreateAutomatons < ActiveRecord::Migration
  def change
    create_table :automatons do |t|
      t.integer :rule
      t.integer :input_state

      t.timestamps
    end
  end
end
