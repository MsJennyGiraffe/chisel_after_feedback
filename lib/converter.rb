class Converter

  def initialize(string_input)
    @content = string_input
    converted_contents
  end

  def split_string_by_new_line
    @content.split("\n")
  end

  def converted_contents
    output = split_string_by_new_line.map do |line|
      line = header_converter(line)
      line = strong(line)
      line = emphasis(line)
    end
    output.join
  end

  def header_converter(line)
    count = line.count("#")
    if count > 0
      line.sub!("#" * count, "<h#{count}>")
      "#{line}</h#{count}>"
    else
      "<p>#{line}</p>"
      end
  end

  def strong(line)
    count = 0
    while line.include?("**")
      if count.even?
        line = line.sub("**", "<strong>")
      else
        line = line.sub("**", "</strong>")
      end
      count += 1
    end
    line
  end

  def emphasis(line)
    count = 0
    while line.include?("*")
      if count.even?
        line = line.sub("*", "<em>")
      else
        line = line.sub("*", "</em>")
      end
      count += 1
    end
    line
  end
end
