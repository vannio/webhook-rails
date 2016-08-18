class EmailsController < ApplicationController
  skip_before_action  :verify_authenticity_token
  EMAIL_TYPES = [
    "Order",
    "UserConfirmation",
    "Shipment",
    "ReferAFriend",
    "GetABookDiscount"
  ].freeze


  def index
    @email_types = EMAIL_TYPES
  end

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
