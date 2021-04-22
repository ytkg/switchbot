# frozen_string_literal: true

module Switchbot
  class Humidifier < Device
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
