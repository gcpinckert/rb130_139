# Write a minitest assertion that will fail if:
  # the class of value is not Numeric
  # the class of value is not one of Numeric's subclasses

require 'minitest/autorun'

class TypeTest < Minitest::Test
  def test_numeric
    value = 1
    assert_kind_of(Numeric, value)
  end
end