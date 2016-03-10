require 'pry'

class FileReader

  def read_input_file
    text = File.open(ARGV[0], "r")
    contents = text.read
    text.close
    contents
  end

  def outputting_to_file(output_formatted)
    outputting = File.open(ARGV[1], "w")
    outputting.write(output_formatted)
    outputting.close
  end

end
