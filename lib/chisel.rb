require_relative "../lib/filereader"
require_relative "../lib/converter"

class Chisel

  def initialize
    @file_reader = FileReader.new
  end

  def read_from_file
    contents = @file_reader.read_input_file
  end

  def output_to_file(output_formatted)
    output = @file_reader.outputting_to_file(output_formatted)
  end

  def convert
    contents = read_from_file
    converter = Converter.new(contents)
    output = converter.converted_contents
    output_to_file(output)
  end
end

c = Chisel.new
c.convert
