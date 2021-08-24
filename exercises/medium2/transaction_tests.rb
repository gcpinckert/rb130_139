require 'minitest/autorun'
require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(30)
  end

  # prompts the user to input a number representing amount paid
  # assigns this to the instance variable @amount_paid
  # if amount is > 0 or not the full amount requested prints message
  def test_prompt_for_payment
    input = StringIO.new("30\n")
    output = StringIO.new
    @transaction.prompt_for_payment(input: input, output: output)
    assert_equal(30, @transaction.amount_paid)
  end
end