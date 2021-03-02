# frozen_string_literal: true

module FixtureUtil
  def fixture(file)
    File.open("spec/support/fixtures/#{file}").read
  end
end
