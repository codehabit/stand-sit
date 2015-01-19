class EventsController < ApplicationController
  include ActionController::Live
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

  def status
    response.headers["Content-Type"] = "text/event-stream"
    time_message = view_context.distance_of_time_in_words(Event.last.created_at, Time.now)
    response.stream.write "data: #{time_message}\n\n"
  rescue IOError
    logger.info "Stream closed"
  ensure
    response.stream.close
  end

  private

  def event_params
    params.require(:event).permit!
  end
end

