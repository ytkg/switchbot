# frozen_string_literal: true

module Switchbot
  class Light
    extend Forwardable

    def_delegators :@device, :commands, :on, :off

    def initialize(client:, device_id:)
      @device = Device.new(client: client, device_id: device_id)
    end

    def brightness_up
      commands(command: 'brightnessUp')
    end

    def brightness_down
      commands(command: 'brightnessDown')
    end
  end
end
