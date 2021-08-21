# Write a minitest that will fail if the 'xyz' is not in the Array list

require 'minitest/autorun'

class IncludedTest < Minitest::Test
  def test_included
    list = ['abc', 'xyz']
    assert_includes(list, 'xyz')
  end
end
