class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.integer :user_id
      t.date :c_date
      t.string :top_item
      t.string :bottom_item
      t.string :shoes_item
      t.string :description
      t.timestamps
    end
  end
end
