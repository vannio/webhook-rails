class EmailsController < ApplicationController
  skip_before_action  :verify_authenticity_token

  def create
    body = request.body.read
    unless(body.empty?)
      data = JSON.parse(body)
      params = {
        address: data['Address'],
        category: data['EmailType'],
        event: data['Event']
      }

      Email.create(params)
      render inline: 'Webhook captured'
    else
      raise 'Error capturing webhook'
    end
  end
end
