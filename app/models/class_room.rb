class ClassRoom < ApplicationRecord
  belongs_to :teacher, class_name: "User"
  has_many :class_room_students, dependent: :destroy
  has_many :students, through: :class_room_students, source: :user
  has_many :pending_students, -> { where(class_room_students: { approval_status: "pending" }) },
           through: :class_room_students, source: :user
  has_many :approved_students, -> { where(class_room_students: { approval_status: "approved" }) },
           through: :class_room_students, source: :user

  enum :visibility, { visible_to_all: 0, invite_only: 1 }
  enum :status, { open: 0, closed: 1 }

  validates :name, presence: true
  validates :subject, presence: true
  validates :quota, presence: true, numericality: { greater_than: 0 }
  validates :teacher, presence: true

  validate :teacher_must_be_teacher_role

  scope :public_classes, -> { where(visibility: :visible_to_all) }
  scope :private_classes, -> { where(visibility: :invite_only) }
  scope :open_classes, -> { where(status: :open) }
  scope :closed_classes, -> { where(status: :closed) }

  def can_join?(user)
    return false if closed?
    return false if quota_reached?
    return false if user_already_joined?(user)

    true
  end

  def join_status_for(user)
    return "full" if quota_reached?
    return "already_joined" if user_already_joined?(user)
    return "pending" if user_pending_approval?(user)
    return "can_join" if can_join?(user)
    "closed" if closed?
  end

  def quota_reached?
    approved_students.count >= quota
  end

  def user_already_joined?(user)
    class_room_students.approved.exists?(user: user)
  end

  def user_pending_approval?(user)
    class_room_students.pending_approval.exists?(user: user)
  end

  def request_to_join(user)
    return false unless can_join?(user)

    if invite_only?
      class_room_students.create(user: user, approval_status: :pending)
    else
      class_room_students.create(user: user, approval_status: :approved)
    end
  end

  def approve_student(user)
    return false if quota_reached?

    enrollment = class_room_students.pending_approval.find_by(user: user)
    enrollment&.update(approval_status: :approved)
  end

  def reject_student(user)
    enrollment = class_room_students.pending_approval.find_by(user: user)
    enrollment&.update(approval_status: :rejected)
  end

  def remove_student(user)
    class_room_students.find_by(user: user)&.destroy
  end

  private

  def teacher_must_be_teacher_role
    errors.add(:teacher, "must have teacher role") if teacher && !teacher.teacher?
  end
end
