class CreateClassRoomStudents < ActiveRecord::Migration[8.0]
  def change
    create_table :class_room_students do |t|
      t.references :class_room, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :approval_status, default: 0, null: false
      t.datetime :requested_at
      t.datetime :approved_at

      t.timestamps
    end

    add_index :class_room_students, [ :class_room_id, :user_id ], unique: true
    add_index :class_room_students, :approval_status
  end
end
