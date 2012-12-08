class AddEmailToPerson < ActiveRecord::Migration
  def change
    change_table :people do |t|
      t.text :email
    end
  end
end
