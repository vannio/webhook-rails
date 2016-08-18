module Helpers
  def post_dummy_emails
    example_emails = [
      { address:"barney@lostmy.name", email_type: "Shipment", event:"send" },
      { address:"tom@lostmy.name", email_type: "UserConfirmation", event:"click" },
      { address:"jacob@lostmy.name", email_type: "Order", event:"open" },
      { address:"rehat@lostmy.name", email_type: "Shipment", event:"send" },
      { address:"callum@lostmy.name", email_type: "ReferAFriend", event:"send" },
      { address:"simon@lostmy.name", email_type: "Shipment", event:"send" },
      { address:"josh@lostmy.name", email_type: "UserConfirmation", event:"open" }
    ]

    example_emails.each do |email|
      Email.create(email)
    end
  end
end
