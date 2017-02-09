class NightReader
  attr_reader :input
  def initialize(input)
    @input = input
  end

  def split_input
    input.split("\n")
  end

  def split_line
    split_input.map { |letter| letter.chars }
  end

  def builds_keys
    keys = []
    line1, line2, line3 = split_line
    until line1.empty?
        keys << [line1.shift(2).join, line2.shift(2).join, line3.shift(2).join]
    end
    keys
  end

  def braille_to_english(keys)
    keys.map { |key| translate(key)}
  end

  def format_english(keys)
   braille_to_english(keys).join
  end

  def capitalize(string)
    if string.include? "^"
      a = string.gsub(/\^./){|letter| letter.upcase}
      a.gsub(/\^/){|letter| "" }
    elsif string.include? "#"
      a = string.gsub(/\#./){|letter| letter}
      a.gsub(/\#/){|letter| "" }
    end
  end

  def translate(key)
    dictionary = {["0.", "..", ".."]=>"a",
 ["0.", "0.", ".."]=>"b",
 ["00", "..", ".."]=>"c",
 ["00", ".0", ".."]=>"d",
 ["0.", ".0", ".."]=>"e",
 ["00", "0.", ".."]=>"f",
 ["00", "00", ".."]=>"g",
 ["0.", "00", ".."]=>"h",
 [".0", "0.", ".."]=>"i",
 [".0", "00", ".."]=>"j",
 ["0.", "..", "0."]=>"k",
 ["0.", "0.", "0."]=>"l",
 ["00", "..", "0."]=>"m",
 ["00", ".0", "0."]=>"n",
 ["0.", ".0", "0."]=>"o",
 ["00", "0.", "0."]=>"p",
 ["00", "00", "0."]=>"q",
 ["0.", "00", "0."]=>"r",
 [".0", "0.", "0."]=>"s",
 [".0", "00", "0."]=>"t",
 ["0.", "..", "00"]=>"u",
 ["0.", "0.", "00"]=>"v",
 [".0", "00", ".0"]=>"w",
 ["00", "..", "00"]=>"x",
 ["00", ".0", "00"]=>"y",
 ["0.", ".0", "00"]=>"z",
 ["..", "00", "0."]=>"!",
 ["..", "..", "0."]=>"'",
 ["..", "0.", ".."]=>",",
 ["..", "..", "00"]=>"-",
 ["..", "00", ".0"]=>".",
 ["..", "0.", "00"]=>"?",
 ["..", "..", ".0"]=>"^",
 [".0", ".0", "00"]=>"#",
 ["..", "..", ".."]=>" ",
 ["..0.", "....", ".0.."]=>"A",
 ["..0.", "..0.", ".0.."]=>"B",
 ["..00", "....", ".0.."]=>"C",
 ["..00", "...0", ".0.."]=>"D",
 ["..0.", "...0", ".0.."]=>"E",
 ["..00", "..0.", ".0.."]=>"F",
 ["..00", "..00", ".0.."]=>"G",
 ["..0.", "..00", ".0.."]=>"H",
 ["...0", "..0.", ".0.."]=>"I",
 ["...0", "..00", ".0.."]=>"J",
 ["..0.", "....", ".00."]=>"K",
 ["..0.", "..0.", ".00."]=>"L",
 ["..00", "....", ".00."]=>"M",
 ["..00", "...0", ".00."]=>"N",
 ["..0.", "...0", ".00."]=>"O",
 ["..00", "..0.", ".00."]=>"P",
 ["..00", "..00", ".00."]=>"Q",
 ["..0.", "..00", ".00."]=>"R",
 ["...0", "..0.", ".00."]=>"S",
 ["...0", "..00", ".00."]=>"T",
 ["..0.", "....", "..00"]=>"U",
 ["..0.", "..0.", ".000"]=>"V",
 ["...0", "..00", ".0.0"]=>"W",
 ["..00", "....", ".000"]=>"X",
 ["..00", "...0", ".000"]=>"Y",
 ["..0.", "...0", ".000"]=>"Z",
 [".00.", ".0..", "00.."]=>"0",
 [".00.", ".00.", "00.."]=>"1",
 [".000", ".0..", "00.."]=>"2",
 [".000", ".0.0", "00.."]=>"3",
 [".00.", ".0.0", "00.."]=>"4",
 [".000", ".00.", "00.."]=>"5",
 [".000", ".000", "00.."]=>"6",
 [".00.", ".000", "00.."]=>"7",
 [".0.0", ".00.", "00.."]=>"8",
 [".0.0", ".000", "00.."]=>"9"}
  dictionary[key]
  end
end
