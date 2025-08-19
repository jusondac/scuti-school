class AgenciesController < ApplicationController
  before_action :authenticate_user!, except: [ :new, :create ]
  before_action :set_agency, only: [ :show, :edit, :update, :destroy, :approve, :reject ]
  before_action :authorize_admin, only: [ :index, :approve, :reject, :destroy, :bulk_action ]

  def index
    # Initialize search parameters
    @q = Agency.ransack(params[:q])
    base_agencies = @q.result.includes(:user)

    # Counts
    @pending_count  = base_agencies.pending_approval.count
    @approved_count = base_agencies.approved.count
    @rejected_count = base_agencies.rejected.count

    # Paginated results
    @pagy_pending,  @pending_agencies  = pagy_with_rescue(base_agencies.pending_approval,  :pending_page)
    @pagy_approved, @approved_agencies = pagy_with_rescue(base_agencies.approved,          :approved_page)
    @pagy_rejected, @rejected_agencies = pagy_with_rescue(base_agencies.rejected,          :rejected_page)
  end

  def show
    authorize_agency_access
  end

  def new
    @agency = Agency.new
  end

  def create
    @agency = Agency.new(agency_params)

    # Create user account for agency
    user_email = agency_params[:email]
    user = User.find_by(email: user_email)

    if user.nil?
      # Create new user account
      password = SecureRandom.hex(8)
      user = User.create!(
        email: user_email,
        password: password,
        role: :agency,
        access_level: :normal
      )

      # TODO: Send email with login credentials
      # AgencyMailer.account_created(user, password).deliver_now
    elsif !user.agency?
      # Update existing user to agency role
      user.update!(role: :agency, access_level: :normal)
    end

    @agency.user = user
    @agency.status = :pending

    if @agency.save
      redirect_to root_path, notice: "Agency application submitted successfully! We will review your request and contact you soon."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    authorize_agency_access
  end

  def update
    authorize_agency_access

    if @agency.update(agency_params)
      redirect_to @agency, notice: "Agency information updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def approve
    @agency.update!(status: :approved)
    redirect_to agencies_path, notice: "Agency '#{@agency.name}' has been approved."
  end

  def reject
    @agency.update!(status: :rejected)
    redirect_to agencies_path, notice: "Agency '#{@agency.name}' has been rejected."
  end

  def destroy
    @agency.destroy
    redirect_to agencies_path, notice: "Agency has been deleted."
  end

  def bulk_action
    agency_ids = params[:agency_ids] || []
    action = params[:bulk_action]

    if agency_ids.empty?
      redirect_to agencies_path, alert: "Please select at least one agency."
      return
    end

    agencies = Agency.where(id: agency_ids)

    case action
    when "approve"
      agencies.update_all(status: :approved)
      redirect_to agencies_path, notice: "#{agencies.count} agencies have been approved."
    when "reject"
      agencies.update_all(status: :rejected)
      redirect_to agencies_path, notice: "#{agencies.count} agencies have been rejected."
    when "delete"
      count = agencies.count
      agencies.destroy_all
      redirect_to agencies_path, notice: "#{count} agencies have been deleted."
    else
      redirect_to agencies_path, alert: "Invalid action selected."
    end
  end

  private

  def pagy_with_rescue(scope, page_param)
    pagy(scope, page_param: page_param, items: 10)
  rescue Pagy::OverflowError
    pagy(scope, page_param: page_param, page: 1, items: 10)
  rescue StandardError
    [nil, scope.limit(10)]
  end

  def set_agency
    @agency = Agency.find(params[:id])
  end

  def agency_params
    params.require(:agency).permit(:name, :email, :description, :phone, :address)
  end

  def authorize_admin
    redirect_to root_path, alert: "Access denied." unless current_user.can_manage_agencies?
  end

  def authorize_agency_access
    unless current_user.admin? || (@agency.user == current_user)
      redirect_to root_path, alert: "Access denied."
    end
  end
end
