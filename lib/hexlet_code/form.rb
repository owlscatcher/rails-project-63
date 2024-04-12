# frozen_string_literal: true

module HexletCode
  class Form # rubocop:disable Style/Documentation
    def initialize(entity, options = {})
      @entity = entity
      @inputs = []
      @buttons = []
      @form_options = build_options(options)
    end

    def build_options(options = {})
      form_url = options.fetch(:url, "#")
      form_method = options.fetch(:method, "post")

      { action: form_url, method: form_method }.merge(options).except(:url)
    end

    def render_form
      Tag.build("form", @form_options) { [@inputs, @buttons].join }
    end

    def input(attribute_name, options = {})
      value = @entity.public_send(attribute_name)
      field_type = get_field_type(options)
      label = label_for(attribute_name, options)

      case field_type
      when "textarea"
        @inputs << [label, Inputs::BaseTextarea.build_tag(attribute_name, value, options.except(:label))].join
      when "input"
        @inputs << [label, Inputs::BaseInput.build_tag(attribute_name, value, options.except(:label))].join
      end
    end

    def submit(value = "Save", options = {})
      @buttons << Buttons::BaseSubmit.build_tag(value, options)
    end

    private

    def get_field_type(options)
      if options.key? :as
        options[:as] == :text ? "textarea" : options[:as].to_s
      else
        "input"
      end
    end

    def label_for(attribute_name, options = {})
      if options.key? :label
        options[:label] ? Labels::BaseLabel.build_tag(attribute_name, options.except(:label)) : ""
      else
        Labels::BaseLabel.build_tag(attribute_name, options.except(:label))
      end
    end
  end
end
