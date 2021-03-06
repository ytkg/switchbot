# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'json'
require 'active_support/all'
require_relative 'switchbot/version'
require_relative 'switchbot/client'
require_relative 'switchbot/device'
require_relative 'switchbot/scene'
require_relative 'switchbot/light'

module Switchbot
  class Error < StandardError; end
  # Your code goes here...
end
