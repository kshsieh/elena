class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :date
      t.string   :group_name
      t.string   :venue_name
      t.integer  :user_id
      t.timestamps
    end
  end
end
