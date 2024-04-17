# frozen_string_literal: true

module HexletCode
  class FormBuilder
    attr_accessor :form_template

    def initialize(entity, options = {})
      @entity = entity
      @form_template = {
        options: build_form_options(options),
        inputs: [],
        submit: {}
      }
    end

    def input(attribute_name, **options)
      input_options = options.except(:as, :label)
      input_options[:name] = attribute_name
      input_options[:type] = options.fetch(:as, 'string')
      input_options[:value] = @entity.public_send(attribute_name)
      input_options[:label] = options.fetch(:label, true)

      @form_template[:inputs] << input_options
    end

    def submit(value = 'Save', options = {})
      options[:type] = 'submit'

      @form_template[:submit] = options.merge(value:)
    end

    private

    def build_form_options(options = {})
      form_url = options.fetch(:url, '#')
      form_method = options.fetch(:method, 'post')

      { action: form_url, method: form_method }.merge(options).except(:url)
    end
  end
end
