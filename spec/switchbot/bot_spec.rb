# frozen_string_literal: true

RSpec.describe Switchbot::Bot do
  include_context :api_variables

  let(:bot) { client.bot(device_id) }
  let(:device_id) { 'C271111EC0AB' }
  let(:parameter) { 'default' }
  let(:command_type) { 'command' }

  describe '#status' do
    subject { bot.status }

    before do
      allow(client).to receive(:status)
    end

    it do
      subject
      expect(client).to have_received(:status).with(device_id: device_id)
    end
  end

  describe '#on' do
    subject { bot.on }

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
    subject { bot.off }

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
    subject { bot.on? }

    before do
      allow(client).to receive(:status).and_return({ body: { power: 'on' } })
    end

    it { is_expected.to eq true }
  end

  describe '#off?' do
    subject { bot.off? }

    before do
      allow(client).to receive(:status).and_return({ body: { power: 'off' } })
    end

    it { is_expected.to eq true }
  end

  describe '#press' do
    subject { bot.press }

    before do
      allow(client).to receive(:commands)
    end

    it do
      subject
      expect(client).to have_received(:commands)
        .with(device_id: device_id, command: 'press', parameter: parameter, command_type: command_type)
    end
  end
end
