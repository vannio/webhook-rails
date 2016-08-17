feature 'Summary stats' do
	scenario 'should display a stats table' do
		visit('/emails')
		within_table('summary') do
			expect(page).to have_content('Total number of emails sent')
			expect(page).to have_content('Total number of emails opened')
			expect(page).to have_content('Total number of clicks')
			expect(page).to have_content('Open rate per email type')
			expect(page).to have_content('Click rate per email type')
		end
	end
end
