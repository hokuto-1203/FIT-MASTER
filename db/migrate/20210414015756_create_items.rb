class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :description
      t.string :image
      t.integer :choice
      t.date  :r_date

      t.timestamps
    end
  end
end
