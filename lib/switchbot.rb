# frozen_string_literal: true

require 'faraday'
require 'faraday_middleware'
require 'json'
require 'active_support/all'
require_relative 'switchbot/version'
require_relative 'switchbot/client'

module Switchbot
  class Error < StandardError; end
  # Your code goes here...
end
