class AddStateToGoal < ActiveRecord::Migration
  def change
    change_table :goals do |t|
      t.remove :completed
      t.text :state
    end
  end
end
