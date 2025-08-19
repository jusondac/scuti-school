class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin

  def index
    @students_count = User.where(role: :student).count
    @teachers_count = User.where(role: :teacher).count
    @agencies_count = User.where(role: :agency).count
    @total_users = User.count
  end

  def students
    @students = User.where(role: :student).order(:email)
  end

  def teachers
    @teachers = User.where(role: :teacher).order(:email)
  end

  private

  def authorize_admin
    redirect_to root_path, alert: "Access denied." unless current_user.can_view_users_list?
  end
end
