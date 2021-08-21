# Write a test that will fail if:
# 'xyz' is oe of the elements in the array list

require 'minitest/autorun'

class XyzTest < Minitest::Test
  def test_xyz
    list = []
    refute_includes(list, 'xyz')
  end
end