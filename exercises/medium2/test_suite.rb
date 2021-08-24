require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @cash_register = CashRegister.new(100)
  end
  
  # accept_money(transaction) -> @total_money += transaction.amount_paid
  def test_accept_money
    transaction = Transaction.new(50)
    transaction.amount_paid = 50

    initial_amount = @cash_register.total_money
    @cash_register.accept_money(transaction)
    closing_amount = @cash_register.total_money
    assert_equal(initial_amount + 50, closing_amount)
  end

  # change(transaction) -> transaction.amount_paid - transaction.item_cost
  def test_change
    transaction = Transaction.new(75)
    transaction.amount_paid = 80

    assert_equal(5, @cash_register.change(transaction))
  end

  # give_receipt(transaction) -> puts "You've paid $#{transaction.item_cost}."
  # assert_output {...} -> fails if stdout does not output the expected results
  def test_give_receipt
    transaction = Transaction.new(50)
    assert_output("You've paid $#{transaction.item_cost}.\n") do 
      @cash_register.give_receipt(transaction)
    end
  end
end