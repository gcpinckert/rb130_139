=begin
- Modify the given code such that it prints the expected output
- Read the text from a simple test file that you provide
- You can use the Ruby File class to work with files
- Read the test file in the #process method and pass the text to the block
  provided in each call
- You shouldn't need additional changes beyond the #process method or the blocks
- You can have different numbers than the sample output, but you should have the
  indicated format

File::open
- open(filename, mode="r") { |file| block } -> obj
- When given a block, the block is passed the opened file as an argument
- The File object wil automatically be closed when the block terminates
- The value of the block is returned by the ::open method
- file = File.open("filename.txt") => opens file and creates a file object
  - does not retrieve contents of file

Reading the file:
- read the whole file all at once : file_data = file.read
- for multi-line files you can split the file_data, or use readlines
  plus the chomp method to remove new_line characters:
  - file_data = file.readlines.map(&:chomp)
- close the file when done to free up memory and system resources
  - file.close
- OR, use File::read:
  - file_data = File.read("user.txt").split
- Process the file one line at a time using File::foreach
  - File.foreach(filename) { |line| # does something }

- paragraphs are separated by an empty line
- each line ends with a newline character
- a single space separates all the words

Algorithm: 
- Open the file and create a file object to manipulate
- Read the file and extract the file data
- Yield to the given block, passing the file data as an argument
- Close the file when done
- Return value?

Blocks:
- Analyse paragraphs:
  - file data is the block parameter
  - split the file data along the lines of empty line (\n\n)
  - count the size of the ensuring array as the num of paragraphs
  - Output: #{num of paragraphs} paragraphs
- Analyse lines:
  - file data is block parameter
  - split the file data along newlines
  - count the size of the ensuing array as the num of lines
  - Output the `#{num of lines} lines`
- Analyse words:
  - file data is the block parameter
  - split the file data along spaces
  - count the size of the ensuing array as the num of words
  - output the #{num of words} words
=end

class TextAnalyzer
  def process(filename)
    file = File.open(filename)
    file_data = file.read
    puts yield(file_data) if block_given?
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process("sample_text.txt") { |text| "#{text.split("\n\n").size} paragraphs" }

analyzer.process("sample_text.txt") { |text| "#{text.split("\n").size} lines" }

analyzer.process("sample_text.txt") { |text| "#{text.split.size} words" }

# Expected Output:
# 3 paragraphs
# 15 lines
# 126 words
puts "2nd Sample"
analyzer.process("sample_2.txt") { |text| "#{text.split("\n\n").size} paragraphs" }

analyzer.process("sample_2.txt") { |text| "#{text.split("\n").size} lines" }

analyzer.process("sample_2.txt") { |text| "#{text.split.size} words" }