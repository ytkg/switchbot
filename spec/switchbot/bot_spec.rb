# frozen_string_literal: true

RSpec.describe Switchbot::Bot do
  include_context :api_variables

  let(:bot) { client.bot(device_id) }
  let(:device_id) { 'C271111EC0AB' }
  let(:parameter) { 'default' }
  let(:command_type) { 'command' }

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
