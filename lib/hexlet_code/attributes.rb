# frozen_string_literal: true

module HexletCode
  module Attributes # rubocop:disable Style/Documentation
    class << self
      def to_s(attr = {})
        attr.map { |k, v| "#{k}=\"#{v}\"" }.join(" ")
      end
    end
  end
end
