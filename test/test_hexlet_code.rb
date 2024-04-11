# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def setup
    @single_tag = load_fixture("single_tag")
    @base_tag_with_content = load_fixture("base_tag_with_content")
    @form_empty = load_fixture("form_empty")
    @form_empty_with_url = load_fixture("form_empty_with_url")
    @form_with_inputs = load_fixture("form_with_inputs")
    @form_with_textfields = load_fixture("form_with_textfields")
    @form_with_textfields_with_options = load_fixture("form_with_textfields_with_options")
    @form_with_textfields_with_default_options = load_fixture("form_with_textfields_with_default_options")

    test_user = Struct.new("User", :name, :job, keyword_init: true)
    @user = test_user.new name: "rob"
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_generate_single_tag
    assert(::HexletCode::Tag.build("img", { src: "path/to/img" }) == @single_tag)
  end

  def tast_generate_tag_with_content
    assert(::HexletCode::Tag.build("div", { class: "card shadow" }) { "Card content" } == @base_tag_with_content)
  end

  def test_generate_empty_form
    assert(::HexletCode.form_for(@user) == @form_empty)
  end

  def test_generate_empty_form_with_url
    assert(::HexletCode.form_for(@user, { url: "path/to/route" }) == @form_empty_with_url)
  end

  def test_generate_from_with_inputs
    form = ::HexletCode.form_for @user, url: "#" do |f|
      f.input :name, class: "user-input"
      f.input :job
    end

    p form
    p @form_with_inputs
    assert(form == @form_with_inputs)
  end

  def test_generate_form_with_textarea_with_options
    skip
    form = ::HexletCode.form_for @user, url: "#" do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert(form == @form_with_textfields_with_options)
  end

  def test_generate_from_with_textarea_with_default_options
    skip
    form = ::HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end

    assert(form == @form_with_textfields_with_default_options)
  end
end
