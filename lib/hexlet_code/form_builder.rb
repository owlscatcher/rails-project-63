# frozen_string_literal: true

module HexletCode
  class FormBuilder # rubocop:disable Style/Documentation
    attr_accessor :entity, :form_body

    def initialize(entity, options = {})
      @entity = entity
      @inputs = []
      @form_options = build_options(options)
    end

    def build_options(options = {})
      form_url = options.fetch(:url, "#")
      form_method = options.fetch(:method, "post")

      { action: form_url, method: form_method }
    end

    def render_form
      form = Tag.build("form", @form_options) { @inputs.join }

      # Well ¯\_(ツ)_/¯, but it'll be beautiful.
      form.gsub("\n\n", "\n")
    end

    def input(attribute_name, options = {})
      value = @entity.public_send(attribute_name)
      field_type = get_field_type(options)

      case field_type
      when "textarea"
        @inputs << Inputs::BaseTextarea.build_tag(attribute_name, value, options)
      when "input"
        @inputs << Inputs::BaseInput.build_tag(attribute_name, value, options)
      end
    end

    private

    def get_field_type(options)
      if options.key? :as
        options[:as] == :text ? "textarea" : options[:as].to_s
      else
        "input"
      end
    end
  end
end
