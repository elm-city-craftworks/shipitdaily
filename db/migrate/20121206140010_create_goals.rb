class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text       :description
      t.boolean    :completed
      t.belongs_to :author
      t.timestamps
    end
  end
end
