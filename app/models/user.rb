class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { student: 0, teacher: 1, admin: 2 }
  enum :access_level, { normal: 0, high: 1 }

  # Teacher associations
  has_many :teaching_classes, class_name: "ClassRoom", foreign_key: "teacher_id", dependent: :destroy

  # Student associations
  has_many :class_room_students, dependent: :destroy
  has_many :enrolled_classes, through: :class_room_students, source: :class_room
  has_many :pending_classes, -> { where(class_room_students: { approval_status: "pending" }) },
           through: :class_room_students, source: :class_room
  has_many :approved_classes, -> { where(class_room_students: { approval_status: "approved" }) },
           through: :class_room_students, source: :class_room

  def self.from_google(u)
    create_with(uid: u[:uid], provider: "google", password: devise.friendly_token[0, 20]).find_or_create_by!(email: u[:email])
  end

  def can_create_class?
    teacher? || admin?
  end

  def can_approve_students?(class_room)
    return true if admin?
    return true if teacher? && teaching_classes.include?(class_room)
    false
  end

  def can_view_class_details?(class_room)
    return true if admin?
    return true if teacher? && teaching_classes.include?(class_room)
    return true if student? && approved_classes.include?(class_room)
    false
  end
end
