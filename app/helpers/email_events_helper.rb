module EmailEventsHelper
  def count_event(event)
    Email.where(event: event).count
  end
end
