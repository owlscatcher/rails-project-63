# frozen_string_literal: true

module HexletCode
  module FormRender
    class << self
      def render_html(form)
        inputs_options = form.form_template[:inputs]
        submit_options = form.form_template[:submit]
        submit_tag = Tag.build('input', submit_options) unless submit_options.empty?

        input_tags = inputs_options.map do |input|
          "HexletCode::Inputs::#{input[:type].capitalize}Input".constantize.build(input)
        end

        Tag.build('form', form.form_template[:options]) do
          [input_tags, submit_tag].join
        end
      end
    end
  end
end
