describe 'Webhook capture' do
  context 'with no webhook data' do
    it 'should raise an error' do
      expect{post('/emails')}.to raise_error('Error capturing webhook')
    end
  end

  context 'with correct webhook data' do
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

  context 'with incorrectly formatted email address' do
    let(:example_params) {
      {
        "Address":"barney@lostmy",
        "EmailType":"Shipment",
        "Event":"send",
        "Timestamp":1432820696
      }
    }

    it 'should not add entry to database' do
      expect{
        post('/emails', params: example_params, as: :json)
      }.to_not change{ Email.all.count }
    end
  end

  context 'with gibberish webhook data' do
    let(:example_params) {
      {
        "wddw":"barney@lostmy.name",
        "wqwe":"Shipment",
        "Eveeeent":"send",
        "Timeseeetamp":1432820696
      }
    }

    it 'should not add entry to database' do
      expect{
        post('/emails', params: example_params, as: :json)
      }.to_not change{ Email.all.count }
    end

    it 'should raise an error' do
      expect{post('/emails')}.to raise_error('Error capturing webhook')
    end
  end
end
