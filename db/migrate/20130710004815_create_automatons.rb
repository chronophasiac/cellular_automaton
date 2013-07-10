class CreateAutomatons < ActiveRecord::Migration
  def change
    create_table :automatons do |t|
      t.integer :rule

      t.timestamps
    end
  end
end
