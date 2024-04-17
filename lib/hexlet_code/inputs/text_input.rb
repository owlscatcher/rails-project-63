# frozen_string_literal: true

module HexletCode
  module Inputs
    class TextInput < BaseInput
      class << self
        EXCEPTING_OPTIONS = %i[type value as label].freeze
        COLS = 20
        ROWS = 40

        def build_input(options)
          options[:cols] = COLS unless options.key? :cols
          options[:rows] = ROWS unless options.key? :rows

          Tag.build('textarea', options.except(*EXCEPTING_OPTIONS)) { options[:value] }
        end

        def build(options)
          build_label(options) + build_input(options)
        end
      end
    end
  end
end
