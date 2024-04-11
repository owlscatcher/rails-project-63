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
      form = Tag.build("form", @form_options) { @inputs.join("\t") }

      # Well ¯\_(ツ)_/¯, but it'll be beautiful.
      form.gsub("\n\n", "\n")
    end

    def input(attr_name, options = {})
      field_name = get_field_type(options)
      default_options = {}
      default_options[:name] = attr_name
      default_options[:type] = if options.key? :as
                                 options[:as]
                               else
                                 "text"
                               end
      default_options[:value] = @entity.public_send(attr_name)
      tag_options = default_options.merge(options)

      @inputs << Tag.build(tag_options[:type], tag_options)
    end

    def get_field_type(options)
      if options.key? :as
        options[:as].to_s
      else
        "input"
      end
    end
  end
end
