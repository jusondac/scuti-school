class AddTimestampsToClassRoomStudents < ActiveRecord::Migration[8.0]
  def change
    add_column :class_room_students, :requested_at, :datetime
    add_column :class_room_students, :approved_at, :datetime
  end
end
