feature 'Summary totals' do
  before do
    post_dummy_emails
    visit('/')
  end

  scenario 'should display a totals in a table' do
    within_table('totals') do
      expect(page).to have_content('Total number of emails sent')
      expect(page).to have_content('Total number of emails opened')
      expect(page).to have_content('Total number of clicks')
    end
  end

  scenario 'should display correct total number of sent emails' do
    sent_cell = find('td', text: 'Total number of emails sent').find('+td')
    expect(sent_cell).to have_content(4)
  end

  scenario 'should display correct total number of opened emails' do
    opened_cell = find('td', text: 'Total number of emails opened').find('+td')
    expect(opened_cell).to have_content(2)
  end

  scenario 'should display correct total number of clicks' do
    clicked_cell = find('td', text: 'Total number of clicks').find('+td')
    expect(clicked_cell).to have_content(1)
  end
end
