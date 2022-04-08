# Добавление, редактирование, удаление событий, установка пин-кода на побытие
class EventsController < ApplicationController
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_event, only: %i[show edit update destroy]
  # before_action :password_guard!, only: [:show]

  # Предохранитель от потери авторизации в нужных экшенах
  after_action :verify_authorized, except: %i[show index]

  # GET /events
  def index
    @events = Event.all
  end

  # GET /events/1
  def show
    if params[:pincode].present? && @event.pincode_valid?(params[:pincode])
      cookies.permanent["events_#{@event.id}_pincode"] = params[:pincode]
    end

    begin
      authorize @event
    rescue Pundit::NotAuthorizedError
      flash.now[:alert] = t('controllers.events.wrong_pincode') if params[:pincode].present?
      render 'password_form'
    end

    @new_comment = @event.comments.build(params[:comment])
    @new_subscription = @event.subscriptions.build(params[:subscription])
    @new_photo = @event.photos.build(params[:photo])
  end

  # GET /events/new
  def new
    @event = Event.new
    authorize @event
  end

  # GET /events/1/edit
  def edit
    authorize @event
  end

  # POST /events
  def create
    @event = Event.new(event_params)

    authorize @event

    @event.user = current_user

    if @event.save
      redirect_to @event, notice: t('controllers.events.created')
    else
      render :new
    end
  end

  # PATCH/PUT /events/1
  def update
    authorize @event

    if @event.update(event_params)
      redirect_to @event, notice: t('controllers.events.updated')
    else
      render :edit
    end
  end

  # DELETE /events/1
  def destroy
    authorize @event

    @event.destroy
    redirect_to events_url, notice: t('controllers.events.destroyed')
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :address, :datetime, :description, :pincode)
  end
end
