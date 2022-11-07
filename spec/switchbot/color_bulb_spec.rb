# frozen_string_literal: true

RSpec.describe Switchbot::ColorBulb do
  include_context :api_variables

  let(:color_bulb) { client.color_bulb(device_id) }
  let(:device_id) { 'C271111EC0AB' }
  let(:parameter) { 'default' }
  let(:command_type) { 'command' }

  describe '#status' do
    subject { color_bulb.status }

    before do
      allow(client).to receive(:status)
    end

    it do
      subject
      expect(client).to have_received(:status).with(device_id: device_id)
    end
  end

  describe '#on' do
    subject { color_bulb.on }

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
    subject { color_bulb.off }

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
    subject { color_bulb.on? }

    before do
      allow(client).to receive(:status).and_return({ body: { power: 'on' } })
    end

    it { is_expected.to eq true }
  end

  describe '#off?' do
    subject { color_bulb.off? }

    before do
      allow(client).to receive(:status).and_return({ body: { power: 'off' } })
    end

    it { is_expected.to eq true }
  end

  describe '#toggle' do
    subject { color_bulb.toggle }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: 'toggle', parameter: parameter, command_type: command_type)
    end
  end

  describe '#brightness' do
    subject { color_bulb.brightness(50) }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: 'setBrightness', parameter: 50, command_type: command_type)
    end
  end

  describe '#color' do
    subject { color_bulb.color('255:0:0') }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: 'setColor', parameter: '255:0:0', command_type: command_type)
    end
  end

  describe '#color_temperature' do
    subject { color_bulb.color_temperature(2700) }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: 'setColorTemperature', parameter: 2700, command_type: command_type)
    end
  end
end
