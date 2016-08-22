class EmailsController < ApplicationController
  skip_before_action  :verify_authenticity_token

  def index
    @email_types = Email::TYPES
  end

  def create
    body = request.body.read
    unless(body.empty?)
      data = JSON.parse(body)
      params = {
        address: data['Address'],
        email_type: data['EmailType'],
        event: data['Event']
      }

      Email.create(params)
      ActionCable.server.broadcast('emails', message: 'update_counts')
      render inline: 'Webhook captured'
    else
      raise 'Error capturing webhook'
    end
  end
end
