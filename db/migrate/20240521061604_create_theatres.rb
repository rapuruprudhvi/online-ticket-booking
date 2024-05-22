class CreateTheatres < ActiveRecord::Migration[7.1]
  def change
    create_table :theatres do |t|
      t.string :name
      t.integer :capacity

      t.timestamps
    end
  end
end
