feature 'Summary stats' do
  before do
    visit('/emails')
    @open_rate_cell = find('td', text: 'Open rate per email type').find('+td')
    @click_rate_cell = find('td', text: 'Click rate per email type').find('+td')
  end

  scenario 'should display a stats table' do
		within_table('summary') do
			expect(page).to have_content('Total number of emails sent')
			expect(page).to have_content('Total number of emails opened')
			expect(page).to have_content('Total number of clicks')
			expect(page).to have_content('Open rate per email type')
			expect(page).to have_content('Click rate per email type')
		end
	end

  scenario 'should display rates in a table' do
    within_table('summary') do
      within(@open_rate_cell) do
        expect(page).to have_css('table')
        expect(page).to have_css("tr:nth-child(#{Email::TYPES.length})")
      end

      within(@click_rate_cell) do
        expect(page).to have_css('table')
        expect(page).to have_css("tr:nth-child(#{Email::TYPES.length})")
      end
    end
  end

  scenario 'should display rates as a percentage' do
    within_table('summary') do
      expect(@open_rate_cell).to have_content('%')
      expect(@click_rate_cell).to have_content('%')
    end
  end
end
