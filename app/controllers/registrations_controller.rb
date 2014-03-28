class RegistrationsController < ApplicationController

  before_filter :authenticate_admin!, :except => [:new, :create, :show]

  # GET /registrations
  # GET /registrations.json
  def index
    @registrations = Registration.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @registrations }
    end
  end

  # GET /registrations/1
  # GET /registrations/1.json
  def show
    @registration = Registration.find(params[:id])

    if params[:charge_id] == @registration.stripe_charge_token
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @registration }
      end
    else
      redirect_to root_path, notice: "You can't look at that :)"
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
    @registration = Registration.new(params[:registration])

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
  end

  # PUT /registrations/1
  # PUT /registrations/1.json
  def update
    @registration = Registration.find(params[:id])

    respond_to do |format|
      if @registration.update_attributes(params[:registration])
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
end
