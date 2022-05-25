# frozen_string_literal: true

module Switchbot
  class ColorBulb < Device
    def toggle
      commands(command: 'toggle')
    end

    def brightness(value)
      commands(command: 'setBrightness', parameter: value)
    end

    def color(value)
      commands(command: 'setColor', parameter: value)
    end

    def color_temperature(value)
      commands(command: 'setColorTemperature', parameter: value)
    end
  end
end
