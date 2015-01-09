class ExpoRegistrationsController < ApplicationController
  before_action :set_expo_registration, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @expo_registrations = ExpoRegistration.all
    respond_with(@expo_registrations)
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
        # result = PonyExpress.registration_confirmation(@contact).deliver
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

  private
    def set_expo_registration
      @expo_registration = ExpoRegistration.find(params[:id])
    end

    def expo_registration_params
      params.require(:expo_registration).permit(:name, :email, :year, :newsletter)
    end
end
