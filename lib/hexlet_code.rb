# frozen_string_literal: true

require 'active_support/inflector'

module HexletCode
  autoload :VERSION, "#{__dir__}/hexlet_code/version"
  autoload :Tag, "#{__dir__}/hexlet_code/tag"
  autoload :FormBuilder, "#{__dir__}/hexlet_code/form_builder"
  autoload :FormRender, "#{__dir__}/hexlet_code/form_render"
  autoload :Inputs, "#{__dir__}/hexlet_code/inputs/inputs"

  class Error < StandardError; end

  def self.form_for(entity, options = {})
    builded_form = FormBuilder.new(entity, options)
    yield(builded_form) if block_given?
    FormRender.render_html(builded_form.form_template)
  end
end
