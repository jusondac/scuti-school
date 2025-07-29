class ClassRoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_class_room, only: [ :show, :edit, :update, :destroy, :join, :approve_student, :reject_student ]
  before_action :check_teacher_or_admin, only: [ :new, :create ]
  before_action :check_class_owner_or_admin, only: [ :edit, :update, :destroy, :approve_student, :reject_student ]
  before_action :check_admin_or_member, only: [ :show ]

  def index
    @class_rooms = case current_user.role
    when "admin"
                     ClassRoom.all
    when "teacher"
                     current_user.teaching_classes
    when "student"
                     ClassRoom.public_classes.open_classes
    end

    @class_rooms = @class_rooms.includes(:teacher, :students, :pending_students)
  end

  def show
    @join_status = @class_room.join_status_for(current_user) if current_user.student?
    @pending_students = @class_room.pending_students if can_manage_students?
    @approved_students = @class_room.approved_students if can_view_students?
  end

  def new
    @class_room = ClassRoom.new
  end

  def create
    @class_room = current_user.teaching_classes.build(class_room_params)

    if @class_room.save
      redirect_to @class_room, notice: "Classroom was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @class_room.update(class_room_params)
      redirect_to @class_room, notice: "Classroom was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @class_room.destroy
    redirect_to class_rooms_path, notice: "Classroom was successfully deleted."
  end

  def join
    if @class_room.request_to_join(current_user)
      message = @class_room.invite_only? ? "Join request sent for approval." : "Successfully joined the classroom."
      redirect_to @class_room, notice: message
    else
      case @class_room.join_status_for(current_user)
      when "full"
        redirect_to @class_room, alert: "Classroom is full."
      when "already_joined"
        redirect_to @class_room, alert: "You have already joined this classroom."
      when "pending"
        redirect_to @class_room, alert: "Your join request is pending approval."
      when "closed"
        redirect_to @class_room, alert: "This classroom is closed."
      else
        redirect_to @class_room, alert: "Unable to join the classroom."
      end
    end
  end

  def approve_student
    user = User.find(params[:user_id])
    if @class_room.approve_student(user)
      redirect_to @class_room, notice: "#{user.email} has been approved."
    else
      redirect_to @class_room, alert: "Unable to approve student. Classroom may be full."
    end
  end

  def reject_student
    user = User.find(params[:user_id])
    if @class_room.reject_student(user)
      redirect_to @class_room, notice: "#{user.email} has been rejected."
    else
      redirect_to @class_room, alert: "Unable to reject student."
    end
  end

  private

  def set_class_room
    @class_room = ClassRoom.find(params[:id])
  end

  def class_room_params
    params.require(:class_room).permit(:name, :subject, :description, :visibility, :status, :quota)
  end

  def check_teacher_or_admin
    redirect_to root_path, alert: "Access denied." unless current_user.can_create_class?
  end

  def check_class_owner_or_admin
    redirect_to root_path, alert: "Access denied." unless current_user.can_approve_students?(@class_room)
  end

  def check_admin_or_member
    redirect_to root_path, alert: "Access denied." unless current_user.can_view_class_details?(@class_room)
  end

  def can_manage_students?
    current_user.can_approve_students?(@class_room)
  end

  def can_view_students?
    current_user.can_view_class_details?(@class_room)
  end
end
