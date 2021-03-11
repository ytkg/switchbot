# frozen_string_literal: true

module Switchbot
  class Light < Device
    def brightness_up
      commands(command: 'brightnessUp')
    end

    def brightness_down
      commands(command: 'brightnessDown')
    end
  end
end
