class ProjectChannel < ApplicationCable::Channel
  def subscribed
    stream_from "project_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Comment.create! content: data['comment']
  end
end
