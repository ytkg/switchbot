# frozen_string_literal: true

RSpec.describe Switchbot::Device do
  include_context :api_variables

  let(:device) { client.device(device_id) }
  let(:device_id) { 'C271111EC0AB' }

  describe '#status' do
    subject { device.status }

    before do
      allow(client).to receive(:status)
    end

    it do
      subject
      expect(client).to have_received(:status).with(device_id: device_id)
    end
  end
end
