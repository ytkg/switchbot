# frozen_string_literal: true

require 'securerandom'
require 'base64'
require 'openssl'
require 'faraday'
require 'faraday/typhoeus'
require 'active_support/all'
require_relative 'switchbot/version'
require_relative 'switchbot/client'
require_relative 'switchbot/device'
require_relative 'switchbot/scene'
require_relative 'switchbot/bot'
require_relative 'switchbot/light'
require_relative 'switchbot/humidifier'
require_relative 'switchbot/color_bulb'

module Switchbot
  class Error < StandardError; end
  # Your code goes here...
end
