# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      EXCEPTING_OPTIONS = %i[type value as label].freeze
      COLS = 20
      ROWS = 40

      def build_input
        @input[:cols] = COLS unless @input.key? :cols
        @input[:rows] = ROWS unless @input.key? :rows

        Tag.build('textarea', @input.except(*EXCEPTING_OPTIONS)) { @input[:value] }
      end

      def build
        build_label + build_input
      end
    end
  end
end
