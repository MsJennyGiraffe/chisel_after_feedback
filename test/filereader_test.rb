require 'minitest/autorun'
require_relative '../lib/filereader.rb'

class FilereaderTest < Minitest::Test

  def setup
    @filereader = FileReader.new
  end

  def test_filereader_can_return_contents_of_a_file
    assert_equal 186, @filereader.read_input_file.length
  end

  def test_filereader_can_write_to_a_file
    @filereader.outputting_to_file("hello world")
    assert_equal 11, File.read("../files/my_output.html").length
  end

end
