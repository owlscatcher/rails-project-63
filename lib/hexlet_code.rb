# frozen_string_literal: true

module HexletCode # rubocop:disable Style/Documentation
  autoload :Tag, "#{__dir__}/hexlet_code/tag"
  autoload :FormBuilder, "#{__dir__}/hexlet_code/form_builder"
  autoload :VERSION, "#{__dir__}/hexlet_code/version"
  autoload :Inputs, "#{__dir__}/hexlet_code/inputs"

  class Error < StandardError; end

  def self.form_for(entity, options = {})
    form = FormBuilder.new(entity, options)
    yield(form) if block_given?
    form.render_form
  end
end
