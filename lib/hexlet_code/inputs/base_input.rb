# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      class << self
        def build_tag(attribute_name, value, options = {})
          options[:name] = attribute_name
          options[:type] = 'text'
          options[:value] = value

          Tag.build('input', options)
        end
      end
    end
  end
end
