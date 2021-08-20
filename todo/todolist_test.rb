require 'pry'
require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todolist'
#require_relative 'todo'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)

    @empty_list = TodoList.new("Empty List")
  end

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size) # ok to hard code this number?
  end

  def test_first
    assert_equal(@todo1, @list.first)
    assert_nil(@empty_list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
    assert_nil(@empty_list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal(@todos[1, 2], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal(@todos[0, 2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_add_raise_typeerror
    assert_raises(TypeError) { @list.add("go to the store") }
    assert_raises(TypeError) { @list.add(123) }
    assert_raises(TypeError) { @list.add(['a', 'b', 'c']) }
    assert_raises(TypeError) { @list.add(@empty_list) }
  end

  def test_concat
    todo = Todo.new("Buy groceries")
    @list << todo
    
    assert_equal(4, @list.size)
    assert_equal(todo, @list.last)
  end

  def test_add_alias
    todo = Todo.new("Buy groceries")
    @list.add(todo)

    assert_equal(4, @list.size)
    assert_equal(todo, @list.last)
  end

  def test_item_at
    assert_raises(ArgumentError) { @list.item_at }
    assert_equal(@todo2, @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    assert_raises(ArgumentError) { @list.mark_done_at }
    assert_raises(IndexError) { @list.mark_done_at(100) }

    @list.mark_done_at(0)
    assert_equal(true, @list.item_at(0).done?)
    assert_equal(false, @list.item_at(1).done?)
  end

  def test_mark_undone_at
    assert_raises(ArgumentError) { @list.mark_undone_at }
    assert_raises(IndexError) { @list.mark_undone_at(100) }

    @list.done!
    @list.mark_undone_at(0)
    assert_equal(false, @list.item_at(0).done?)
    assert_equal(true, @list.item_at(1).done?)
  end

  def test_done!
    @list.done!
    assert_equal(true, @todos.all?(&:done?))
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(ArgumentError) { @list.remove_at }
    assert_raises(IndexError) { @list.remove_at(100) }

    assert_equal(@todo2, @list.remove_at(1))
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s_undone
    str = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(str, @list.to_s)
  end

  def test_to_s_one_done
    str = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    @list.mark_done_at(0)
    assert_equal(str, @list.to_s)
  end

  def test_to_s_all_done
    str = <<~OUTPUT.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    @list.done!
    assert_equal(str, @list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal(@todos, result)
  end

  def test_each_returns
    obj = @list.each { |todo| todo }
    assert_same(@list, obj)
  end

  def test_select
    @todo1.done!
    done1 = @todos.select { |todo| todo.done? }
    done2 = @list.select  { |todo| todo.done? }

    assert_equal(done1, done2.to_a)
    assert_equal(true, done2.done?)
    assert_instance_of(TodoList, done2)
  end
end