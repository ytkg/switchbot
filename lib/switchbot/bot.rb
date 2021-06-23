# frozen_string_literal: true

module Switchbot
  class Bot < Device
    def press
      commands(command: 'press')
    end
  end
end
