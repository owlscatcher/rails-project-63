# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      def build_input
        Tag.build('input', @input.except(:as, :label))
      end

      def build
        build_label + build_input
      end
    end
  end
end
