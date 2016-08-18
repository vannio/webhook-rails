module EmailEventsHelper
  def count_event(event)
    Email.where(event: event).count
  end

  def percentage_rate(category, event)
    num = Email.calculate_rate(category, event)
    sprintf('%20.2g%', num)
  end
end
