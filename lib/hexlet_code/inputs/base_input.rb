# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      class << self
        def build_label(options)
          options[:label] ? Tag.build('label', { for: options[:name] }) { options[:name].capitalize } : ''
        end
      end
    end
  end
end
