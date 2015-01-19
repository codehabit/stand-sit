class EventDecorator < Draper::Decorator
  delegate_all
  include ActionView::Helpers::DateHelper

  def duration_message
    now = Time.now
    event_start = self.created_at
    distance_of_time_in_words(event_start, now)
  end
end

