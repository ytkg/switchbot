# frozen_string_literal: true

RSpec.describe Switchbot::Humidifier do
  include_context :api_variables

  let(:humidifier) { client.humidifier(device_id) }
  let(:device_id) { 'C271111EC0AB' }
  let(:command) { 'setMode' }

  describe '#status' do
    subject { humidifier.status }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :status)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:status)
    end
  end

  describe '#on' do
    subject { humidifier.on }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :on)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:on)
    end
  end

  describe '#off' do
    subject { humidifier.off }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :off)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:off)
    end
  end

  describe '#on?' do
    subject { humidifier.on? }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :on?).and_return(true)
    end

    it { is_expected.to eq true }
  end

  describe '#off?' do
    subject { humidifier.off? }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :off?).and_return(true)
    end

    it { is_expected.to eq true }
  end

  describe '#mode' do
    subject { humidifier.mode(50) }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: command, parameter: '50')
    end
  end

  describe '#auto' do
    subject { humidifier.auto }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: command, parameter: 'auto')
    end
  end

  describe '#low' do
    subject { humidifier.low }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: command, parameter: '101')
    end
  end

  describe '#medium' do
    subject { humidifier.medium }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: command, parameter: '102')
    end
  end

  describe '#high' do
    subject { humidifier.high }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: command, parameter: '103')
    end
  end
end
