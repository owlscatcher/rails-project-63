# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def setup
    @fixtures = generate_fixtures

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
      f.input :name, class: "user-input", label: false
      f.input :job, label: false
    end

    assert_equal(@fixtures[:form_with_inputs], form)
  end

  def test_generate_form_with_textarea_with_options
    form = ::HexletCode.form_for @user, url: "#" do |f|
      f.input :job, label: false, as: :text, rows: 50, cols: 50
    end

    assert_equal(@fixtures[:form_with_textfields_with_options], form)
  end

  def test_generate_from_with_textarea_with_default_options
    form = ::HexletCode.form_for @user do |f|
      f.input :job, as: :text, label: false
    end

    assert_equal(@fixtures[:form_with_textfields_with_default_options], form)
  end

  def test_generate_form_with_submit
    form = ::HexletCode.form_for @user do |f|
      f.input :name
      f.input :job
      f.submit
    end

    assert_equal(@fixtures[:form_with_submit], form)
  end

  def test_generate_form_with_submit_with_options
    form = ::HexletCode.form_for @user, url: "#" do |f|
      f.input :name
      f.input :job
      f.submit "Wow"
    end

    assert_equal(@fixtures[:form_with_submit_with_options], form)
  end

  def test_generate_form_with_options
    form = ::HexletCode.form_for @user, url: "posts", class: "form-horizontal" do |f|
      f.input :name
      f.input :job
      f.submit "Wow"
    end

    assert_equal(@fixtures[:form_with_options], form)
  end

  def test_invalid_attributes_for_input
    assert_raises(NoMethodError) do
      ::HexletCode.form_for @user, url: "#" do |f|
        f.input :name
        f.input :job
        f.input :age
        f.submit "Wow"
      end
    end
  end
end
