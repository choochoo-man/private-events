class EventsController < ApplicationController
  def index
    @past_events = Event.past
    @future_events = Event.future
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    redirect_to @event
  end

  def attend
    @event = Event.find(params[:id])
    if @event.event_attendees&.include?(current_user)
      redirect_to @event, notice: "You are already attending"
    else
      @event.event_attendees << current_user
      redirect_to @event
    end
  end

  def cancel_attendance
    @event = Event.find(params[:id])
    @event.event_attendees.delete(current_user)
    redirect_to @event
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :time)
  end

end
