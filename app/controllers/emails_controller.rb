class EmailsController < ApplicationController
  skip_before_action  :verify_authenticity_token

  def index
    @email_types = Email::TYPES
  end

  def create
    body = request.body.read
    raise 'Error capturing webhook' if body.empty?
    Email.create(params(body))
    render inline: 'Webhook captured'
  end

  def params(body)
    data = JSON.parse(body)
    { address: data['Address'],
      email_type: data['EmailType'],
      event: data['Event'] }
  end
end
