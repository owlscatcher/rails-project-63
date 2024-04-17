# frozen_string_literal: true

module HexletCode
  module Inputs
    class StringInput < BaseInput
      class << self
        def build_input(options)
          Tag.build('input', options.except(:as, :label))
        end

        def build(options)
          build_label(options) + build_input(options)
        end
      end
    end
  end
end
