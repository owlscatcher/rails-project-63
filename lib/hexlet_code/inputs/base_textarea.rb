# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseTextarea # rubocop:disable Style/Documentation
      class << self
        def build_tag(attribute_name, value, options)
          options[:name] = attribute_name
          options[:cols] = 20 unless options.key? :cols
          options[:rows] = 40 unless options.key? :rows

          Tag.build("textarea", options.except(:as)) { value }
        end
      end
    end
  end
end
