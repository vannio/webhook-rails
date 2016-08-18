feature 'Summary totals' do
  let(:example_emails) {[
    { address:"barney@lostmy.name", email_type: "Shipment", event:"send" },
    { address:"tom@lostmy.name", email_type: "UserConfirmation", event:"click" },
    { address:"jacob@lostmy.name", email_type: "Order", event:"open" },
    { address:"rehat@lostmy.name", email_type: "Shipment", event:"send" },
    { address:"callum@lostmy.name", email_type: "ReferAFriend", event:"send" },
    { address:"simon@lostmy.name", email_type: "Shipment", event:"send" },
    { address:"josh@lostmy.name", email_type: "UserConfirmation", event:"open" }
  ]}

  before do
    example_emails.each do |email|
      Email.create(email)
    end
  end

  scenario 'should display correct total number of sent emails' do
    visit('/emails')
    sent_cell = find('td', text: 'Total number of emails sent').find('+td')
    expect(sent_cell).to have_content(4)
  end

  scenario 'should display correct total number of opened emails' do
    visit('/emails')
    opened_cell = find('td', text: 'Total number of emails opened').find('+td')
    expect(opened_cell).to have_content(2)
  end

  scenario 'should display correct total number of clicks' do
    visit('/emails')
    clicked_cell = find('td', text: 'Total number of clicks').find('+td')
    expect(clicked_cell).to have_content(1)
  end
end
