# frozen_string_literal: true

RSpec.describe Switchbot::Scene do
  include_context :api_variables

  let(:scene) { client.scene(scene_id) }
  let(:scene_id) { 'T02-202009221414-48924101' }

  describe '#execute' do
    subject { scene.execute }

    before do
      allow(client).to receive(:execute)
    end

    it do
      subject
      expect(client).to have_received(:execute).with(scene_id: scene_id)
    end
  end
end
