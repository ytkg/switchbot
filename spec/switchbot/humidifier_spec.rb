# frozen_string_literal: true

RSpec.describe Switchbot::Humidifier do
  include_context :api_variables

  let(:humidifier) { client.humidifier(device_id) }
  let(:device_id) { 'C271111EC0AB' }
  let(:command) { 'setMode' }
  let(:command_type) { 'command' }

  describe '#mode' do
    subject { humidifier.mode(50) }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: command, parameter: '50', command_type: command_type)
    end
  end

  describe '#auto' do
    subject { humidifier.auto }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: command, parameter: 'auto', command_type: command_type)
    end
  end

  describe '#low' do
    subject { humidifier.low }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: command, parameter: '101', command_type: command_type)
    end
  end

  describe '#medium' do
    subject { humidifier.medium }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: command, parameter: '102', command_type: command_type)
    end
  end

  describe '#high' do
    subject { humidifier.high }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: command, parameter: '103', command_type: command_type)
    end
  end
end
