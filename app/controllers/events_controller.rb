class EventsController < ApplicationController
  def index
    @current_event = Event.last || Event.create(standing: false)
  end

  def create
    @event = Event.create(event_params)
    if @event.valid?
      redirect_to events_path
    else
      render :index
    end
  end

  private

  def event_params
    params.require(:event).permit!
  end
end

