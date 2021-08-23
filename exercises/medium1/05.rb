=begin
- Using the given code, fill out the method calls for gather
- Should produce the expected output
=end

items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

puts "\n#1\n"
gather(items) do | *produce, wheat |
  puts produce.join(', ')
  puts wheat
end

# Expected Output:
# Let's start gathering food.
# apples, corn, cabbage
# wheat
# We've finished gathering!

puts "\n#2\n"
gather(items) do | apples, *veggies, wheat |
  puts apples
  puts veggies.join(', ')
  puts wheat
end

# Expected Output:
# Let's start gathering food.
# apples
# corn, cabbage
# wheat
# We've finished gathering!

puts "\n#3\n"
gather(items) do | apples, *foods |
  puts apples
  puts foods.join(', ')
end

# Expected Output:
# Let's start gathering food.
# apples
# corn, cabbage, wheat
# We've finished gathering!

puts "\n#4\n"
gather(items) do | apples, corn, cabbage, wheat |
  puts "#{apples}, #{corn}, #{cabbage}, and #{wheat}"
end

# Expected Output:
# Let's start gathering food.
# apples, corn, cabbage, and wheat
# We've finished gathering!
