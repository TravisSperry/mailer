class RegistrationsController < ApplicationController

  before_filter :authenticate_admin!, :except => [:new, :create, :show]

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.where(year: 1)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @registration = Registration.find(params[:id])

    if params[:charge_id] == @registration.stripe_charge_token || admin_signed_in?
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @registration }
      end
    else
      redirect_to root_path, notice: "You can't look at that :)"
    end
  end

  def email_confirmation
    if params[:id]
      @registration = Registration.find(params[:id])

      if PonyExpress.event_registration_confirmation(@registration).deliver
        redirect_to root_url, notice: "Confirmation Sent"
      end
    else
      redirect_to root_url
    end
  end

  # GET /registrations/new
  # GET /registrations/new.json
  def new
    @registration = Registration.new
    @registration.students.build
    @registration.parents.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @registration }
    end
  end

  # GET /registrations/1/edit
  def edit
    @registration = Registration.find(params[:id])
  end

  # POST /registrations
  # POST /registrations.json
  def create
    @registration = Registration.new(registration_params)

    if @registration.fee_waiver?
      #process registration without fee
      respond_to do |format|
        if @registration.save_without_payment
          result = PonyExpress.event_registration_confirmation(@registration).deliver
          format.html { redirect_to @registration, notice: 'Registration was successfully created. Your fee has been waived. Print this page for your records' }
          format.json { render json: @registration, status: :created, location: @registration }
        else
          format.html { render action: "new" }
          format.json { render json: @registration.errors, status: :unprocessable_entity }
        end
      end
    else
      #STRIPE save_with_payment
      respond_to do |format|
        if @registration.save_with_payment
          result = PonyExpress.event_registration_confirmation(@registration).deliver
          format.html { redirect_to registration_path(id: @registration.id, charge_id: @registration.stripe_charge_token), notice: 'Registration was successfully created.' }
          format.json { render json: @registration, status: :created, location: @registration }
        else
          format.html { render action: "new" }
          format.json { render json: @registration.errors, status: :unprocessable_entity }
        end
      end
    end

    rescue Stripe::CardError => e
      redirect_to new_registration_path , alert: e.message + " Please complete your registration with a valid credit card."

    rescue Stripe::InvalidRequestError => e
      redirect_to new_registration_path , alert: e.message + " Please complete your registration with a valid credit card."

  end

  # PUT /registrations/1
  # PUT /registrations/1.json
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(registration_params)
        format.html { redirect_to @registration, notice: 'Registration was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @registration.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registrations/1
  # DELETE /registrations/1.json
  def destroy
    @registration = Registration.find(params[:id])
    @registration.destroy

    respond_to do |format|
      format.html { redirect_to registrations_url }
      format.json { head :no_content }
    end
  end

  private

    # Use this method to whitelist the permissible parameters. Example:
    # params.require(:person).permit(:name, :age)
    # Also, you can specialize this method with per-user checking of permissible attributes.
    def registration_params
      params.require(:registration).permit(
                                          :event_id, :school_name, :fee_waiver, :comments, :consent,
                                          :student_count, :total, :stripe_charge_token, :stripe_card_token,
                                          :contact_email, :cosi_member, :year, students_attributes: [:id, :first_name, :last_name, :registration_id, :grade],
                                          parents_attributes: [:id, :first_name, :last_name, :role, :email, :registration_id, :volunteer])
    end
end
