class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum :role, { student: 0, teacher: 1, admin: 2 }
  enum :access_level, { normal: 0, high: 1 }

  def self.from_google(u)
    create_with(uid: u[:uid], provider: "google", password: devise.friendly_token[0, 20]).find_or_create_by!(email: u[:email])
  end
end
