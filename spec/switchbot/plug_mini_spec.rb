# frozen_string_literal: true

RSpec.describe Switchbot::PlugMini do
  include_context :api_variables

  let(:plug_mini) { client.plug_mini(device_id) }
  let(:device_id) { 'C271111EC0AB' }

  describe '#status' do
    subject { plug_mini.status }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :status)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:status)
    end
  end

  describe '#on' do
    subject { plug_mini.on }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :on)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:on)
    end
  end

  describe '#off' do
    subject { plug_mini.off }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :off)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:off)
    end
  end

  describe '#on?' do
    subject { plug_mini.on? }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :on?).and_return(true)
    end

    it { is_expected.to eq true }
  end

  describe '#off?' do
    subject { plug_mini.off? }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :off?).and_return(true)
    end

    it { is_expected.to eq true }
  end

  describe '#toggle' do
    subject { plug_mini.toggle }

    before do
      allow(Switchbot::Device).to receive_message_chain(:new, :commands)
    end

    it do
      subject
      expect(Switchbot::Device.new).to have_received(:commands).with(command: 'toggle')
    end
  end
end
