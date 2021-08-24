require 'minitest/autorun'
require_relative 'text'

class TextTest < Minitest::Test
  # open the sample file
  # read the text in the file into a string
  # initialize a Text object and pass the string as an argument
  def setup
    @file = File.open('sample.txt')
    @text = Text.new(@file.read)
  end

  # test that all occurrences of 'a' are swapped with 'e'
  def test_swap
    check_against = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT
    assert_equal(check_against, @text.swap('a', 'e'))
  end

  # splits the given string along ' ' and counts ensuing "words"
  def test_word_count
    assert_equal(72, @text.word_count)
  end

  # close the file
  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end