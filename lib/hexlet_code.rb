# frozen_string_literal: true

require_relative "hexlet_code/version"
require_relative "hexlet_code/tag"
require_relative "hexlet_code/attributes"

module HexletCode # rubocop:disable Style/Documentation
  autoload :Tag, "./hexlet_code/tag"
  autoload :Attributes, "./hexlet_code/attributes"

  class Error < StandardError; end

  def self.form_for(user, options = {})
    form_options = if options.key?(:url)
                     { action: options[:url].to_s, method: "post" }
                   else
                     { action: "#", method: "post" }
                   end
    Tag.build("form", form_options)
  end
end
