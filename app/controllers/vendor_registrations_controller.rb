class VendorRegistrationsController < ApplicationController
  before_action :set_vendor_registration, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @vendor_registrations = VendorRegistration.all
    respond_with(@vendor_registrations)
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
    @vendor_registration.save
    respond_with(@vendor_registration)
  end

  def update
    @vendor_registration.update(vendor_registration_params)
    respond_with(@vendor_registration)
  end

  def destroy
    @vendor_registration.destroy
    respond_with(@vendor_registration)
  end

  private
    def set_vendor_registration
      @vendor_registration = VendorRegistration.find(params[:id])
    end

    def vendor_registration_params
      params.require(:vendor_registration).permit(:organization_name, :contact, :email, :address, :city, :state, :zip, :phone, :ages, :registration_fee, :late_fee, :ad_fee, :total)
    end
end
