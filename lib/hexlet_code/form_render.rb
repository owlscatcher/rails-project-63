# frozen_string_literal: true

module HexletCode
  module FormRender
    class << self
      def render_html(form_template)
        submit_tag = Tag.build('input', form_template[:submit]) unless form_template[:submit].empty?

        input_tags = form_template[:inputs].map do |input|
          "HexletCode::Inputs::#{input[:type].capitalize}Input".constantize.new(input).build
        end

        Tag.build('form', form_template[:options]) { [input_tags, submit_tag].join }
      end
    end
  end
end
