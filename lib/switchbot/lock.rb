# frozen_string_literal: true

module Switchbot
  class Lock
    extend Forwardable

    def_delegators :@device, :status, :commands

    def initialize(client:, device_id:)
      @device = Device.new(client: client, device_id: device_id)
    end

    def lock
      commands(command: 'lock')
    end

    def unlock
      commands(command: 'unlock')
    end
  end
end
