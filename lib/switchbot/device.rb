module Switchbot
  class Device
    attr_reader :client, :device_id

    def initialize(client:, device_id:)
      @client = client
      @device_id = device_id
    end

    def status
      client.status(device_id: device_id)
    end
  end
end
