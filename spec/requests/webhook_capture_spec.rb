describe 'Webhook capture' do
	it 'should add entry to database' do
		expect{post('/emails')}.to change{Email.all.count}.by(1)
	end
end
