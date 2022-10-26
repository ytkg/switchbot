# frozen_string_literal: true

module Switchbot
  class Lock < Device
    def lock
      commands(command: 'lock')
    end

    def unlock
      commands(command: 'unlock')
    end
  end
end
