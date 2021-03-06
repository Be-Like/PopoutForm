class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :name, null: false

      t.timestamps
    end

    add_index :events, :name, unique: true
  end
end
