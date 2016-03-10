require 'minitest/autorun'
require_relative '../lib/chisel.rb'

class ChiselTest < Minitest::Test

  def setup
    @chisel = Chisel.new
  end

  def test_chisel_can_store_output_to_file
    @chisel.output_to_file("content")
    assert_equal "content", File.read("../files/my_output.html")
  end

  def test_chisel_can_read_contents_from_a_file
    @chisel.read_from_file
    assert_equal 186, File.read("../files/my_input.markdown").length
  end

end
