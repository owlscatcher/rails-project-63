# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "hexlet_code"

require "minitest/autorun"

def load_fixture(fixture_name, path = "fixtures")
  File.read("#{__dir__}/#{path}/#{fixture_name}.html").gsub("\n", "")
end

def generate_fixtures
  fixture_list = generate_fixture_list

  fixture_list.each_with_object({}) do |fixture_symbol, fixtures|
    fixtures[fixture_symbol] = load_fixture(fixture_symbol.to_s)
  end
end

def generate_fixture_list(path = "fixtures")
  Dir.entries("#{__dir__}/#{path}")
     .reject { |file_name| [".", ".."].include?(file_name) }
     .map { |file_name| file_name.gsub(".html", "").to_sym }
end
