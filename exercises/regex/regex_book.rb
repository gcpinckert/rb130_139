def url?(str)
  str.match(/\Ahttps?:\/\/\S+\z/) ? true : false
end

def fields(str)
  str.split(/[ \t,]+/)
end

def mystery_math(str)
  str.sub(/[+\-*\/]/, '?')
end

def danish(str)
  str.sub(/\b(apple|cherry|blueberry)\b/, 'danish')
end

def format_date(str)
  if str.match(/\A\d{4}-\d{2}-\d{2}/)
    str.gsub(/(\d{4})-(\d{2})-(\d{2})/, '\3.\2.\1')
  else
    str
  end
end

def format_date2(str)
  str.gsub(/\A(\d{4})([\-\/])(\d{2})\2(\d{2})\z/, '\4.\3.\1')
end

puts "===== 1 ====="
p url?('http://launchschool.com')   == true
p url?('https://example.com')       == true
p url?('https://example.com hello') == false
p url?('   https://example.com')    == false
puts

puts "===== 2 ====="
p fields("Pete,201,Student") == ["Pete", "201", "Student"]

p fields("Pete \t 201    ,  TA") == ["Pete", "201", "TA"]

p fields("Pete \t 201") == ["Pete", "201"]

p fields("Pete \n 201") == ["Pete", "\n", "201"]
puts

puts "===== 3 ====="
p mystery_math('4 + 3 - 5 = 2') == '4 ? 3 - 5 = 2'

p mystery_math('(4 * 3 + 2) / 7 - 1 = 1') == '(4 ? 3 + 2) / 7 - 1 = 1'
puts

puts "===== 4 ====="
p danish('An apple a day keeps the doctor away') == 'An danish a day keeps the doctor away'

p danish('My favorite is blueberry pie') == 'My favorite is danish pie'

p danish('The cherry of my eye') == 'The danish of my eye'

p danish('apple. cherry. blueberry.') == 'danish. cherry. blueberry.'

p danish('I love pineapple') == 'I love pineapple'
puts

puts "===== 5 ====="
p format_date('2016-06-17') == '17.06.2016'
p format_date('2016/06/17') == '2016/06/17' #(no change)
puts

puts "===== 6 ====="
p format_date2('2016-06-17') == '17.06.2016'
p format_date2('2017/05/03') == '03.05.2017'
p format_date2('2015/01-31') == '2015/01-31' #(no change)
