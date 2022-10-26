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

  describe '#commands' do
    let(:command) { 'turnOn' }
    let(:parameter) { 'default' }
    let(:command_type) { 'command' }

    subject { device.commands(command: command, parameter: parameter, command_type: command_type) }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: command, parameter: parameter, command_type: command_type)
    end
  end

  describe '#on' do
    subject { device.on }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: 'turnOn')
    end
  end

  describe '#off' do
    subject { device.off }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: 'turnOff')
    end
  end

  describe '#on?' do
    subject { device.on? }

    before do
      stub_request(:get, 'https://api.switch-bot.com/v1.1/devices/C271111EC0AB/status')
        .to_return(status: 200, headers: response_headers, body: fixture(fixture_filename))
    end

    context 'power on' do
      let(:fixture_filename) { 'humidifier_power_on_status.json' }
      it { is_expected.to eq true }
    end

    context 'power off' do
      let(:fixture_filename) { 'humidifier_power_off_status.json' }
      it { is_expected.to eq false }
    end
  end

  describe '#off?' do
    subject { device.off? }

    before do
      stub_request(:get, 'https://api.switch-bot.com/v1.1/devices/C271111EC0AB/status')
        .to_return(status: 200, headers: response_headers, body: fixture(fixture_filename))
    end

    context 'power on' do
      let(:fixture_filename) { 'humidifier_power_on_status.json' }
      it { is_expected.to eq false }
    end

    context 'power off' do
      let(:fixture_filename) { 'humidifier_power_off_status.json' }
      it { is_expected.to eq true }
    end
  end
end
