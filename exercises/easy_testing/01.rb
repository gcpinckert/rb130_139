# Write a minitest assertion that will fail if the value.odd? is not true
require 'minitest/autorun'

class OddTest < Minitest::Test
  def test_odd
    value = [1, 2].sample
    # fails if value = 2, passes if value = 1
    assert_equal(true, value.odd?)
  end
end

# use assert(obj) to check for truthiness
# Optional 2nd argument is the message to display
# common to use 2nd argument with assert, which isn't very specific
# assert isn't used directly in most tests b/c it is so general
# usually we are checking for a specific return value
# i.e. assert(code_to_test) => passes if code returns any truthy value
# vs. assert_equal(true, code_to_test) => passes only if code returns true
