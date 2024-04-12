# frozen_string_literal: true

module HexletCode
  autoload :VERSION, "#{__dir__}/hexlet_code/version"
  autoload :Tag, "#{__dir__}/hexlet_code/tag"
  autoload :Form, "#{__dir__}/hexlet_code/form"
  autoload :Inputs, "#{__dir__}/hexlet_code/inputs/inputs"
  autoload :Buttons, "#{__dir__}/hexlet_code/buttons/buttons"
  autoload :Labels, "#{__dir__}/hexlet_code/labels/labels"

  class Error < StandardError; end

  def self.form_for(entity, options = {})
    form = Form.new(entity, options)
    yield(form) if block_given?
    form.render_form
  end
end
