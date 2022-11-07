# frozen_string_literal: true

module Switchbot
  class Bot
    extend Forwardable

    def_delegators :@device, :status, :commands, :on, :off, :on?, :off?

    def initialize(client:, device_id:)
      @device = Device.new(client: client, device_id: device_id)
    end

    def press
      commands(command: 'press')
    end
  end
end
