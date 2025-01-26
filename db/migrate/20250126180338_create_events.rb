class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description
      t.references :host, null: false, foreign_key: { to_table: :users }
      t.datetime :date, null: false
      t.string :location, null: false
      t.integer :price, null: false, default: 0
      t.string :event_type, null: false

      t.timestamps
    end
  end
end
