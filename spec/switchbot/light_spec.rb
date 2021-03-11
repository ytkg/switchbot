# frozen_string_literal: true

RSpec.describe Switchbot::Device do
  include_context :api_variables

  let(:light) { client.light(device_id) }
  let(:device_id) { 'C271111EC0AB' }
  let(:parameter) { 'default' }
  let(:command_type) { 'command' }

  describe '#brightness_up' do
    subject { light.brightness_up }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: 'brightnessUp', parameter: parameter, command_type: command_type)
    end
  end

  describe '#brightness_down' do
    subject { light.brightness_down }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: 'brightnessDown', parameter: parameter, command_type: command_type)
    end
  end
end
