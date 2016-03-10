require 'pry'
class Converter

  def initialize(string_input)
    @content = string_input
  end

  def split_string_by_new_line
    @content.split("\n")
  end

  def converted_contents
    @count = 0
    count = split_string_by_new_line.count
    output = split_string_by_new_line.map.with_index do |line, index|
      line = unordered_list_tags_list(line)
      line = header_converter(line)
      line = strong(line)
      line = emphasis(line)
    end
    output = output.join("\n")
    unordered_list_tags(output)
  end

  def unordered_list_tags(html_converted)
    html_converted = html_converted.sub("<li>", "<ul>\n<li>")
    html_converted = html_converted.reverse.sub("</li>".reverse, "</li>\n</ul>".reverse).reverse
  end

  def header_converter(line)
    count = line.count("#")
    if count > 0
      line.sub!("#" * count, "<h#{count}>")
      "#{line}</h#{count}>"
    elsif !line.lstrip.start_with?("<li>")
      "<p>#{line}</p>"
    else
      line
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

  def unordered_list_tags_list(line)
    char_array = line.chars
    if line.lstrip.start_with?("* ")
      index_array = char_array.map.with_index do |char, index|
        if char == "*" && char_array[index + 1] == " "
          char_array[index] = "<li>"
        else
          char
        end
      end
      "#{index_array.join} </li>"
    else
      line
    end
  end
end
