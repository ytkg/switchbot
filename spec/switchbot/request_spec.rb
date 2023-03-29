# frozen_string_literal: true

RSpec.describe Switchbot::Request do
  include_context :api_variables

  let(:request) { described_class.new('token', 'secret') }

  describe '#get' do
    subject { request.get('/v1.1/devices') }

    before do
      stub_request(:get, 'https://api.switch-bot.com/v1.1/devices')
        .to_return(status: 200, headers: response_headers, body: '{}')
    end

    it { is_expected.to eq({}) }
  end

  describe '#get' do
    subject { request.post('/v1.1/scenes/500291B269BE/execute') }

    before do
      stub_request(:post, 'https://api.switch-bot.com/v1.1/scenes/500291B269BE/execute')
        .to_return(status: 200, headers: response_headers, body: '{}')
    end

    it { is_expected.to eq({}) }
  end
end
