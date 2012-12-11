class AddTimezoneToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.text :time_zone
    end
  end
end
