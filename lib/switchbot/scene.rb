module Switchbot
  class Scene
    attr_reader :client, :scene_id

    def initialize(client:, scene_id:)
      @client = client
      @scene_id = scene_id
    end

    def execute
      client.execute(scene_id: scene_id)
    end
  end
end
