class ExpoRegistrationsController < ApplicationController

  before_filter :authenticate_admin!, :only => [:index, :show, :check_in, :edit]

  before_action :set_expo_registration, only: [:show, :edit, :update, :destroy, :check_in]

  respond_to :html

  def index
    @expo_registrations = ExpoRegistration.order(:id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @expo_registrations }
      format.csv { send_data @expo_registrations.to_csv }
    end
  end

  def show
    respond_with(@expo_registration)
  end

  def new
    @expo_registration = ExpoRegistration.new
    respond_with(@expo_registration)
  end

  def edit
  end

  def create
    @expo_registration = ExpoRegistration.new(expo_registration_params)
    respond_to do |format|
      if @expo_registration.save
        result = PonyExpress.expo_registration_confirmation(@expo_registration).deliver #send confirmation email
        format.html { redirect_to root_url, notice: 'You have been registered for the Dublin Summer Camp Expo :)' }
        format.json { render json: @expo_registration, status: :created, location: @expo_registration }
      else
        format.html { render template: "pages/camp_expo" }
        format.json { render json: @expo_registration.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @expo_registration.update(expo_registration_params)
    respond_with(@expo_registration)
  end

  def destroy
    @expo_registration.destroy
    respond_with(@expo_registration)
  end

  def check_in
    if !(@expo_registration.checked_in)
      if @expo_registration.update_attributes checked_in: true, checked_in_at: Date.today
        redirect_to root_url, notice: "This person has checked in!"
      end
    else
      redirect_to root_url, flash: { error: "This person has already checked in!"}
    end
  end

  private
    def set_expo_registration
      @expo_registration = ExpoRegistration.find(params[:id])
    end

    def expo_registration_params
      params.require(:expo_registration).permit(:name, :email, :year, :newsletter, :qr_code, :qr_code_uid)
    end
end
