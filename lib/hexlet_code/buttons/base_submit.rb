# frozen_string_literal: true

module HexletCode
  module Buttons
    class BaseSubmit # rubocop:disable Style/Documentation
      class << self
        def build_tag(value, options = {})
          options[:type] = 'submit'
          options[:value] = value

          Tag.build('input', options)
        end
      end
    end
  end
end
