# frozen_string_literal: true

shared_context :api_variables do
  let(:client) { Switchbot::Client.new('token') }
  let(:response_headers) { { 'Content-Type' => 'application/json' } }
end
