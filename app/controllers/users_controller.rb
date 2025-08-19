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
    @q = User.ransack(params[:q])
    @pagy, @students = pagy(@q.result.where(role: :student).order(:email), items: 15)
  end

  def teachers
    @q = User.ransack(params[:q])
    @pagy, @teachers = pagy(@q.result.where(role: :teacher).order(:email), items: 15)
  end

  private

  def authorize_admin
    redirect_to root_path, alert: "Access denied." unless current_user.can_view_users_list?
  end
end
