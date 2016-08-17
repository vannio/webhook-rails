describe 'Webhook capture' do
	it 'should raise an error with an empty webhook' do
		expect{post('/emails')}.to raise_error('Error capturing webhook')
	end

	# scenario 'with a functioning webhook' do
	# 	it 'should add entry to database' do
	# 		expect{post('/emails')}.to change{Email.all.count}.by(1)
	# 	end
	# end
end
