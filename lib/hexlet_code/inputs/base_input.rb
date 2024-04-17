# frozen_string_literal: true

module HexletCode
  module Inputs
    class BaseInput
      def initialize(input)
        @input = input
      end

      def build_label
        @input[:label] ? Tag.build('label', { for: @input[:name] }) { @input[:name].capitalize } : ''
      end
    end
  end
end
