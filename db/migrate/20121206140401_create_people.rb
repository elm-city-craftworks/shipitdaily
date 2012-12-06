class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.text :uid
      t.timestamps
    end
  end
end
