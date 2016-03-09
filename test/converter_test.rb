require 'minitest/autorun'
require_relative 'test_helper'
require_relative '../lib/converter.rb'

class ConverterTest < Minitest::Test

  def setup
    @converter = Converter.new("**I am *so*** glad this is almost over.")
  end

  def test_header_converter_takes_octothropes_and_turns_them_to_html_headers
    assert_equal "<h1>hello</h1>", @converter.header_converter("#hello")
    assert_equal "<h2>hello</h2>", @converter.header_converter("##hello")
    assert_equal "<h3>hello</h3>", @converter.header_converter("###hello")
    assert_equal "<h4>hello</h4>", @converter.header_converter("####hello")
    assert_equal "<h5>hello</h5>", @converter.header_converter("#####hello")
    assert_equal "<h6>hello</h6>", @converter.header_converter("######hello")
  end

  def test_header_converter_makes_paragraphs_tags_when_no_headers_are_found
    assert_equal "<p>hello</p>", @converter.header_converter("hello")
  end

  def test_strong_returns_strong_tags_where_double_asterics_are_found
    assert_equal "<strong>hello</strong>", @converter.strong("**hello**")
    assert_equal "<strong>hello</strong> <strong>you</strong>", @converter.strong("**hello** **you**")
  end

  def test_emphasis_returns_em_tags_where_single_asterics_are
    assert_equal "<em>hello</em>", @converter.emphasis("*hello*")
  end


  def test_converted_contents_properly_formats_from_markdown_to_html
  assert_equal "<p><strong>I am <em>so</strong></em> glad this is almost over.</p>", @converter.converted_contents
  end

#hardcode branches to test

  def test_unordered_lists_insert_unordered_list_tags_before_and_after_list
    helper = TestHelper.new
    assert_equal helper.list_html, @converter.unordered_lists(helper.list_html, 0, 4)
  end

  def test_unordered_lists_inserts_list_tags_in_place_of_asterics_and_closes_if_it_is_last_or_only_item
    assert_equal "<li>list</li></ul>", @converter.unordered_lists("* list", 2, 2)
  end

  def test_ordered_lists_insert_unordered_list_tags_before_and_after_list
    assert_equal "<ul><li>list</li></ul>", @converter.unordered_lists("* list", 0, 0)
  end

  def test_ordered_lists_changes_list_items_from_numbers_to_ordered_list_tags
  skip
  end

end
