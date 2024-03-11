# frozen_string_literal: true

module HexletCode
  module Tag # rubocop:disable Style/Documentation
    SINGLE_TAGS = %w[br hr meta input img meta].freeze

    class << self
      def build(tag_name, options = {}, *_block)
        plain_attr = HexletCode::Attributes.to_s(options)
        tag_with_attr = [tag_name, plain_attr].join(" ").strip

        if SINGLE_TAGS.include?(tag_name)
          "<#{tag_with_attr}>"
        else
          "<#{tag_with_attr}>#{yield if block_given?}</#{tag_name}>"
        end
      end
    end
  end
end
