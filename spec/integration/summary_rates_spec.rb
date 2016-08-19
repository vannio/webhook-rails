feature 'Summary rates' do
  before do
    visit('/')
  end

  scenario 'should display rates in a table' do
    within_table('rates') do
      expect(page).to have_content('Email type')
      expect(page).to have_content('Open rate')
      expect(page).to have_content('Click rate')
      expect(page).to have_css("tr:nth-child(#{Email::TYPES.length + 1})")
    end
  end

  scenario 'should display rates as a percentage' do
    within_table('rates') do
      expect(find('tr:nth-child(2) td:nth-child(2)')).to have_content('%')
      expect(find('tr:nth-child(2) td:nth-child(3)')).to have_content('%')
      expect(find("tr:nth-child(#{Email::TYPES.length + 1}) td:nth-child(2)")).to have_content('%')
      expect(find("tr:nth-child(#{Email::TYPES.length + 1}) td:nth-child(3)")).to have_content('%')
    end
  end
end
