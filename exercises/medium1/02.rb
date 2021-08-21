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
=end

class TextAnalyzer
  def process
    # your implementation
  end
end

analyzer = TextAnalyzer.new
analyzer.process { # your implementation }
analyzer.process { # your implementation }
analyzer.process { # your implementation }

# Expected Output:
# 3 paragraphs
# 15 lines
# 126 words