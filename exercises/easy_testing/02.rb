# Write a minitest assertion that will fail if value.downcase
# does not return 'xyz'

require 'minitest/autorun'

class CaseTest < Minitest::Test
  def test_downcase
    value = 'XYZ'
    assert_equal('xyz', value.downcase)
  end
end