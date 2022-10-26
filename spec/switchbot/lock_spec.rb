# frozen_string_literal: true

RSpec.describe Switchbot::Lock do
  include_context :api_variables

  let(:lock) { client.lock(device_id) }
  let(:device_id) { 'C271111EC0AB' }
  let(:parameter) { 'default' }
  let(:command_type) { 'command' }

  describe '#lock' do
    subject { lock.lock }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: 'lock', parameter: parameter, command_type: command_type)
    end
  end

  describe '#unlock' do
    subject { lock.unlock }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: 'unlock', parameter: parameter, command_type: command_type)
    end
  end
end
