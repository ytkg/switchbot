# frozen_string_literal: true

module Switchbot
  class Humidifier
    extend Forwardable

    def_delegators :@device, :status, :commands, :on, :off, :on?, :off?

    def initialize(client:, device_id:)
      @device = Device.new(client: client, device_id: device_id)
    end

    def mode(value)
      commands(command: 'setMode', parameter: value.to_s)
    end

    def auto
      mode(:auto)
    end

    def low
      mode(101)
    end

    def medium
      mode(102)
    end

    def high
      mode(103)
    end
  end
end
