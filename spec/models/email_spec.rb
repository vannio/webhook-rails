describe Email, :type => :model do
  before do
    post_dummy_emails
  end

  describe '#calculate_rate' do
    context 'opened emails' do
      it 'returns the correct rate for Order' do
        expect(described_class.calculate_rate('Order','open')).to eq(100);
      end

      it 'returns the correct rate for UserConfirmation' do
        expect(described_class.calculate_rate('UserConfirmation','open')).to eq(50);
      end

      it 'returns the correct rate for Shipment' do
        expect(described_class.calculate_rate('Shipment','open')).to eq(0);
      end

      it 'returns the correct rate for ReferAFriend' do
        expect(described_class.calculate_rate('ReferAFriend','open')).to eq(0);
      end

      it 'returns the correct rate for GetABookDiscount' do
        expect(described_class.calculate_rate('GetABookDiscount','open')).to eq(0);
      end
    end

    context 'clicked emails' do
      it 'returns the correct rate for Order' do
        expect(described_class.calculate_rate('Order','click')).to eq(0);
      end

      it 'returns the correct rate for UserConfirmation' do
        expect(described_class.calculate_rate('UserConfirmation','click')).to eq(50);
      end

      it 'returns the correct rate for Shipment' do
        expect(described_class.calculate_rate('Shipment','click')).to eq(0);
      end

      it 'returns the correct rate for ReferAFriend' do
        expect(described_class.calculate_rate('ReferAFriend','click')).to eq(0);
      end

      it 'returns the correct rate for GetABookDiscount' do
        expect(described_class.calculate_rate('GetABookDiscount','click')).to eq(0);
      end
    end
  end
end
