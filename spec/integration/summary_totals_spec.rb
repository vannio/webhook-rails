feature 'Summary totals' do
  before do
    post_dummy_emails
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
