# Write a minitest assertion that will fail if the Array list is not empty

require 'minitest/autorun'

class EmptyTest < Minitest::Test
  def test_empty
    list = []
    assert_empty(list)
  end
end