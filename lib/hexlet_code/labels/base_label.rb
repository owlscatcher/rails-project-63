# frozen_string_literal: true

module HexletCode
  module Labels
    class BaseLabel # rubocop:disable Style/Documentation
      class << self
        def build_tag(label_for, options)
          options[:for] = label_for

          Tag.build('label', options) { label_for.capitalize }
        end
      end
    end
  end
end
