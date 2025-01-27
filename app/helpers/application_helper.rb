module ApplicationHelper
  include Pagy::Frontend

  def formatted_last_seen(user)
    return "Never logged in" unless user.last_seen_at

    time_difference = Time.current.to_date - user.last_seen_at.to_date
    if time_difference == 0
      "Today #{user.last_seen_at.strftime('%I:%M %p')}"
    elsif time_difference == 1
      "Yesterday #{user.last_seen_at.strftime('%I:%M %p')}"
    else
      user.last_seen_at.strftime("%B %d, %Y %I:%M %p") # Example: "October 9, 2024 10:35 AM"
    end
  end

  def formatted_message_time(message)
    time_difference = Time.current.to_date - message.created_at.to_date
    if time_difference == 0
      "Today #{message.created_at.strftime('%I:%M %p')}"
    elsif time_difference == 1
      "Yesterday #{message.created_at.strftime('%I:%M %p')}"
    else
      message.created_at.strftime("%B %d, %Y %I:%M %p") # Example: "October 9, 2024 10:35 AM"
    end
  end
end
