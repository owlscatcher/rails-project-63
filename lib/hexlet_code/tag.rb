# frozen_string_literal: true

module HexletCode
  module Tag # rubocop:disable Style/Documentation
    SINGLE_TAGS = %w[br hr meta input img meta].freeze

    class << self
      def build(tag_name, options = {}, *_block)
        plained_options = build_options(options)

        if SINGLE_TAGS.include?(tag_name)
          "<#{tag_name} #{plained_options}>"
        else
          "<#{tag_name} #{plained_options}>#{yield if block_given?}</#{tag_name}>"
        end
      end

      def build_options(options)
        options.empty? ? "" : options.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
      end
    end
  end
end
