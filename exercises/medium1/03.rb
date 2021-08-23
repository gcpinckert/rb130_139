=begin
- Modify the given method so the display of items is moved to a block
- implementation should be left up to the user of the gather method

Algorithm:
- Output, "let's start gathering food"
- yield the items argument to the given block
- Output, "nice selection...!"
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items) if block_given?
  puts "Nice selection of food we have gathered!"
end

gather(items) { |foods| puts foods.join(', ') }