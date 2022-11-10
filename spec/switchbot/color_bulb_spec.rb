# frozen_string_literal: true

RSpec.describe Switchbot::ColorBulb do
  include_context :api_variables

  let(:color_bulb) { client.color_bulb(device_id) }
  let(:device_id) { 'C271111EC0AB' }

  describe '#status' do
    subject { color_bulb.status }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :status)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:status)
    end
  end

  describe '#on' do
    subject { color_bulb.on }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :on)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:on)
    end
  end

  describe '#off' do
    subject { color_bulb.off }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :off)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:off)
    end
  end

  describe '#on?' do
    subject { color_bulb.on? }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :on?).and_return(true)
    end

    it { is_expected.to eq true }
  end

  describe '#off?' do
    subject { color_bulb.off? }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :off?).and_return(true)
    end

    it { is_expected.to eq true }
  end

  describe '#toggle' do
    subject { color_bulb.toggle }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: 'toggle')
    end
  end

  describe '#brightness' do
    subject { color_bulb.brightness(50) }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: 'setBrightness', parameter: 50)
    end
  end

  describe '#color' do
    subject { color_bulb.color('255:0:0') }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: 'setColor', parameter: '255:0:0')
    end
  end

  describe '#color_temperature' do
    subject { color_bulb.color_temperature(2700) }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: 'setColorTemperature', parameter: 2700)
    end
  end
end
