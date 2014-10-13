ENV["RAILS_ENV"] ||= 'test'
require 'spec_helper'
require File.expand_path("../../config/environment", __FILE__)
require 'rspec/rails'

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
end

RSpec::Matchers.define :be_valid_game_json do |expected|
  expected_fields = ["playable", "ongoing", "board", "message"]

  match do |actual|
    expected_fields.each do |field|
      expect(actual[field]).not_to be_nil
    end
  end

  failure_message do |actual|
    expected_fields.each do |field|
      return "missing property: '#{field}'" if actual[field].nil?
    end
  end
end
