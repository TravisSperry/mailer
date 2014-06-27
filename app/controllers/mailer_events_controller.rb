class MailerEventsController < ApplicationController
  before_action :set_mailer_event, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_admin!

  # GET /mailer_events
  def index
    @mailer_events = MailerEvent.all
  end

  # GET /mailer_events/1
  def show
  end

  # GET /mailer_events/new
  def new
    @mailer_event = MailerEvent.new
  end

  # GET /mailer_events/1/edit
  def edit
  end

  # POST /mailer_events
  def create
    @mailer_event = MailerEvent.new(mailer_event_params)

    if @mailer_event.save
      redirect_to @mailer_event, notice: 'Mailer event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /mailer_events/1
  def update
    if @mailer_event.update(mailer_event_params)
      redirect_to @mailer_event, notice: 'Mailer event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /mailer_events/1
  def destroy
    @mailer_event.destroy
    redirect_to mailer_events_url, notice: 'Mailer event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mailer_event
      @mailer_event = MailerEvent.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def mailer_event_params
      params.require(:mailer_event).permit(:name, :company, :date, :description, :link)
    end
end
