class CreateClassRooms < ActiveRecord::Migration[8.0]
  def change
    create_table :class_rooms do |t|
      t.string :name, null: false
      t.string :subject, null: false
      t.integer :visibility, default: 0, null: false
      t.integer :quota, default: 30, null: false
      t.integer :status, default: 0, null: false
      t.text :description
      t.references :teacher, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end

    add_index :class_rooms, :visibility
    add_index :class_rooms, :status
  end
end
