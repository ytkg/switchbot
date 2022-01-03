# frozen_string_literal: true

module FixtureUtil
  def fixture(file)
    File.read("spec/support/fixtures/#{file}")
  end
end
