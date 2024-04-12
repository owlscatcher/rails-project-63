# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def setup
    @fixtures = {
      single_tag: load_fixture("single_tag"),
      base_tag_with_content: load_fixture("base_tag_with_content"),
      form_empty: load_fixture("form_empty"),
      form_empty_with_url: load_fixture("form_empty_with_url"),
      form_with_inputs: load_fixture("form_with_inputs"),
      form_with_textfields_with_options: load_fixture("form_with_textfields_with_options"),
      form_with_textfields_with_default_options: load_fixture("form_with_textfields_with_default_options")
    }

    test_user = Struct.new("User", :name, :job, :gender, keyword_init: true)
    @user = test_user.new name: "rob", job: "hexlet", gender: "m"
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_generate_single_tag
    tag = ::HexletCode::Tag.build("img", { src: "path/to/img" })
    assert_equal(@fixtures[:single_tag], tag)
  end

  def tast_generate_tag_with_content
    tag = ::HexletCode::Tag.build("div", { class: "card shadow" }) { "Card content" }
    assert_equal(@fixtures[:base_tag_with_content], tag)
  end

  def test_generate_empty_form
    form = ::HexletCode.form_for(@user)
    assert_equal(@fixtures[:form_empty], form)
  end

  def test_generate_empty_form_with_url
    form = ::HexletCode.form_for(@user, { url: "path/to/route" })
    assert_equal(@fixtures[:form_empty_with_url], form)
  end

  def test_generate_from_with_inputs
    form = ::HexletCode.form_for @user, url: "#" do |f|
      f.input :name, class: "user-input"
      f.input :job
    end

    assert_equal(@fixtures[:form_with_inputs], form)
  end

  def test_generate_form_with_textarea_with_options
    form = ::HexletCode.form_for @user, url: "#" do |f|
      f.input :job, as: :text, rows: 50, cols: 50
    end

    assert_equal(@fixtures[:form_with_textfields_with_options], form)
  end

  def test_generate_from_with_textarea_with_default_options
    form = ::HexletCode.form_for @user do |f|
      f.input :job, as: :text
    end

    assert_equal(@fixtures[:form_with_textfields_with_default_options], form)
  end
end
