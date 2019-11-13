class CreateInfoForms < ActiveRecord::Migration[6.0]
  def change
    create_table :info_forms do |t|
      t.text :name, null: false
      t.references :event, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
