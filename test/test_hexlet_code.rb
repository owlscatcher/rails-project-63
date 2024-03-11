# frozen_string_literal: true

require "test_helper"

class TestHexletCode < Minitest::Test
  def setup
    test_user = Struct.new("User", :name, :job, keyword_init: true)
    @user = test_user.new name: "rob"
  end

  def test_that_it_has_a_version_number
    refute_nil ::HexletCode::VERSION
  end

  def test_generate_single_tag
    expect = "<img src=\"path/to/img\">"
    assert(::HexletCode::Tag.build("img", { src: "path/to/img" }) == expect)
  end

  def tast_generate_tag_with_content
    expect = "<div class=\"card shadow\">Card content</div>"
    assert(::HexletCode::Tag.build("div", { class: "card shadow" }) { "Card content" } == expect)
  end

  def test_generate_empty_form
    expect = "<form action=\"#\" method=\"post\"></form>"
    assert(::HexletCode.form_for(@user) == expect)
  end

  def test_generate_empty_form_with_url
    expect = "<form action=\"path/to/route\" method=\"post\"></form>"
    assert(::HexletCode.form_for(@user, { url: "path/to/route" }) == expect)
  end
end
