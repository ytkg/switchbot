# frozen_string_literal: true

RSpec.describe Switchbot::Light do
  include_context :api_variables

  let(:light) { client.light(device_id) }
  let(:device_id) { 'C271111EC0AB' }

  describe '#on' do
    subject { light.on }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :on)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:on)
    end
  end

  describe '#off' do
    subject { light.off }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :off)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:off)
    end
  end

  describe '#brightness_up' do
    subject { light.brightness_up }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: 'brightnessUp')
    end
  end

  describe '#brightness_down' do
    subject { light.brightness_down }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: 'brightnessDown')
    end
  end
end
