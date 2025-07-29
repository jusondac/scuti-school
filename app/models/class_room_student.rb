class ClassRoomStudent < ApplicationRecord
  belongs_to :class_room
  belongs_to :user

  enum :approval_status, {
    pending: 0,
    approved: 1,
    rejected: 2
  }

  validates :class_room_id, uniqueness: { scope: :user_id }

  scope :pending_approval, -> { where(approval_status: :pending) }
  scope :approved, -> { where(approval_status: :approved) }
  scope :rejected, -> { where(approval_status: :rejected) }

  before_create :set_requested_at
  before_update :set_approved_at, if: :saved_change_to_approval_status?

  private

  def set_requested_at
    self.requested_at = Time.current if requested_at.blank?
  end

  def set_approved_at
    self.approved_at = Time.current if approved?
  end
end
