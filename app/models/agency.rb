class Agency < ApplicationRecord
  # id: integer (PK)
  # name: string
  # email: string
  # description: text
  # status: integer
  # user_id: integer (FK) - not null
  # phone: string
  # address: text
  # created_at: datetime - not null
  # updated_at: datetime - not null
  belongs_to :user

  enum :status, { pending: 0, approved: 1, rejected: 2 }

  validates :name, presence: true, length: { minimum: 2, maximum: 100 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :description, presence: true, length: { minimum: 10, maximum: 1000 }
  validates :phone, presence: true
  validates :address, presence: true

  scope :pending_approval, -> { where(status: :pending) }
  scope :approved_agencies, -> { where(status: :approved) }

  def pending?
    status == "pending"
  end

  def approved?
    status == "approved"
  end

  def rejected?
    status == "rejected"
  end
end
