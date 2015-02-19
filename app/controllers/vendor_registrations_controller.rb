class VendorRegistrationsController < ApplicationController

  before_filter :authenticate_admin!, :only => [:index, :show, :edit]

  before_action :set_vendor_registration, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vendor_registrations = VendorRegistration.order(:id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vendor_registrations }
      format.csv { send_data @vendor_registrations.to_csv }
    end
  end

  def show
    respond_with(@vendor_registration)
  end

  def new
    @vendor_registration = VendorRegistration.new
    respond_with(@vendor_registration)
  end

  def edit
  end

  def create
    @vendor_registration = VendorRegistration.new(vendor_registration_params)

    if @vendor_registration.pay_by_check?
      #process registration without fee
      respond_to do |format|
        if @vendor_registration.save_without_payment
          result = PonyExpress.vendor_registration_confirmation(@vendor_registration).deliver
          format.html { redirect_to root_path, notice: 'Registration was successfully created. You will receive an email confirmation with instructions on paying by check.' }
          format.json { render json: @vendor_registration, status: :created, location: @vendor_registration }
        else
          format.html { render action: "new" }
          format.json { render json: @vendor_registration.errors, status: :unprocessable_entity }
        end
      end
    else
      #STRIPE save_with_payment
      respond_to do |format|
        if @vendor_registration.save_with_payment
          result = PonyExpress.vendor_registration_confirmation(@vendor_registration).deliver
          format.html { redirect_to root_path, notice: 'Registration was successfully created.' }
          format.json { render json: @vendor_registration, status: :created, location: @vendor_registration }
        else
          format.html { render action: "new" }
          format.json { render json: @vendor_registration.errors, status: :unprocessable_entity }
        end
      end
    end

    rescue Stripe::CardError => e
      redirect_to new_vendor_registration_path , alert: e.message + " Please complete your registration with a valid credit card."

    rescue Stripe::InvalidRequestError => e
      redirect_to new_vendor_registration_path , alert: e.message + " Please complete your registration with a valid credit card."
  end

  def update
    @vendor_registration.update(vendor_registration_params)
    respond_with(@vendor_registration)
  end

  def destroy
    @vendor_registration.destroy
    respond_with(@vendor_registration)
  end

  def import
    VendorRegistration.import(params[:file])
    redirect_to vendor_registrations_path, notice: "Vendor Registrations imported."
  end

  private
    def set_vendor_registration
      @vendor_registration = VendorRegistration.find(params[:id])
    end

    def vendor_registration_params
      params.require(:vendor_registration).permit(:organization_name, :contact, :email, :address, :city, :state, :zip, :phone, :ages, :registration_fee, :late_fee, :ad_fee, :total, :vendor_stripe_card_token, :year, :pay_by_check)
    end
end
