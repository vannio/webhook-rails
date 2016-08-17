describe 'Webhook capture' do
	it 'should raise an error with an empty webhook' do
		expect{post('/emails')}.to raise_error('Error capturing webhook')
	end

	context 'with a functioning webhook' do
		let(:example_params) {
			{
				"Address":"barney@lostmy.name",
				"EmailType":"Shipment",
				"Event":"send",
				"Timestamp":1432820696
			}
		}

		it 'should add entry to database' do
			expect{
				post('/emails', params: example_params, as: :json)
			}.to change{ Email.all.count }.by(1)
		end
	end
end
