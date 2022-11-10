# frozen_string_literal: true

RSpec.describe Switchbot::Lock do
  include_context :api_variables

  let(:lock) { client.lock(device_id) }
  let(:device_id) { 'C271111EC0AB' }

  describe '#status' do
    subject { lock.status }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :status)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:status)
    end
  end

  describe '#lock' do
    subject { lock.lock }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: 'lock')
    end
  end

  describe '#unlock' do
    subject { lock.unlock }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: 'unlock')
    end
  end
end
