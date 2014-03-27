class ContactsController < ApplicationController

  before_filter :authenticate_admin!, :except => [:new, :create]

  def index
    @contacts = Contact.all
  end

  def show
    @contact = Contact.find(params[:id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(params[:contact])

      respond_to do |format|
    if @contact.save
      result = PonyExpress.registration_confirmation(@contact).deliver
      format.html { redirect_to root_url, notice: 'You have been added to the list :)' }
      format.json { render json: @contact, status: :created, location: @contact }
    else
      format.html { render template: "pages/home" }
      format.json { render json: @contact.errors, status: :unprocessable_entity }
    end
  end

  end


  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update_attributes(params[:contact])
      redirect_to @contact, :notice  => "Successfully updated contact."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_url, :notice => "Successfully destroyed contact."
  end
end
