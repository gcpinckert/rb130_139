=begin
Create a TodoList which contains a collection of Todo objects.
- Internally with Todo class, we will use an Array to back the collection of Todo objects

Why use a custom collection object?
- allows us to add additional attributes to the collection
- allows us to add additional behaviors specific to todo lists (or the collection type)
- in this case, we can add a title and date to a collection of todo items
- define specific requirements about what types of objects this list should have
  - i.e. work only with Todo objects
  - enforces this requirement within a custom class
=end

# The following class represents a todo item and it's associated data
# attributes: name and description plus "done" flag (boolean)

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
    description == otherTodo.description &&
    done == otherTodo.done
  end
end

# The following class represents a collection of Todo objects
# Performs typical collection-oriented actions
class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, 'can only add Todo objects' unless todo.class == Todo
    todos << todo
  end
  # we can add methods that behave the same with different names using `alias_method`
  # first symbol argument is the method to add
  # second symbol argument is the method to copy
  alias_method :<<, :add

  def size
    todos.size
  end

  def first
    todos[0]
  end

  def last
    todos[-1]
  end

  def to_a
    todos.dup
  end

  def done?
    todos.all?(&:done?)
  end

  def item_at(index)
    todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    todos.each(&:done!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete(item_at(index))
  end

  def to_s
    string = "---- #{title} ----\n"
    string << todos.map(&:to_s).join("\n")
    string
  end

  def each
    # note that we could also rely on Array#each instead of using a while loop
    i = 0

    while i < size
      yield(item_at(i))
      i += 1
    end

    self
  end

  def select
    truthy_list = TodoList.new(title)
    each do |todo|
      truthy_list.add(todo) if yield(todo)
    end

    truthy_list
  end

  def find_by_title(str)
    select { |todo| todo.title == str }.first
  end

  def all_done
    select { |todo| todo.done? }
  end

  def all_not_done
    select { |todo| !todo.done? }
  end

  def mark_done(str)
    # we use the && conditional here as a way to avoid errors
    # if the string passed in as argument is not a title, find_by_title(str)
    # will return nil, and the `Todo#done!` will not execute
    find_by_title(str) && find_by_title(str).done!
  end

  def mark_all_done
    each(&:done!)
  end

  def mark_all_undone
    each(&:undone!)
  end

  private

  attr_reader :todos
end


=begin ASSIGNMENT 12: TODOLIST METHODS
Implement the following methods
- find_by_title -> takes a string argument and returns the first Todo object
  that matches that argument. Return `nil` if no todo is found.
- all_done -> returns a new TodoList object containing all done items
- all_not_done -> returns a new TodoList object containing only the not done
  items
- mark_done -> takes a string as argument, and marks the first Todo object that
  matches the argument as done
- mark_all_done -> mark every todo as done
- mark_all_undone -> mark every todo as not done
=end

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)


=begin ASSIGNMENT 11: TODOLIST SELECT METHOD

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }

puts results.inspect
# #<TodoList:0x000055a1f034b088 @title="Selected Todos", @todos=[#<Todo:0x000055a1f034b538 @title="Buy milk", @description="", @done=true>]>
=end

=begin ASSIGNMENT 10: TODOLIST EACH METHOD

todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end

# Expected Output:
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym
=end

=begin ASSIGNMENT 9: IMPLEMENT CLASS TODOLIST
# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new("Today's Todos")

# ---- Adding to the list -----

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list.add(todo3)                 # adds todo3 to end of list, returns list
list.add(1)                     # raises TypeError with message "Can only add Todo objects"

# <<
# same behavior as add

# ---- Interrogating the list -----

# size
list.size                       # returns 3

# first
list.first                      # returns todo1, which is the first item in the list

# last
list.last                       # returns todo3, which is the last item in the list

#to_a
list.to_a                      # returns an array of all items in the list

#done?
list.done?                     # returns true if all todos in the list are done, otherwise false

# ---- Retrieving an item in the list ----

# item_at
list.item_at                    # raises ArgumentError
list.item_at(1)                 # returns 2nd item in list (zero based index)
list.item_at(100)               # raises IndexError

# ---- Marking items in the list -----

# mark_done_at
list.mark_done_at               # raises ArgumentError
list.mark_done_at(1)            # marks the 2nd item as done
list.mark_done_at(100)          # raises IndexError

# mark_undone_at
list.mark_undone_at             # raises ArgumentError
list.mark_undone_at(1)          # marks the 2nd item as not done,
list.mark_undone_at(100)        # raises IndexError

# done!
list.done!                      # marks all items as done

# ---- Deleting from the list -----

# shift
list.shift                      # removes and returns the first item in list

# pop
list.pop                        # removes and returns the last item in list

# remove_at
list.remove_at                  # raises ArgumentError
list.remove_at(1)               # removes and returns the 2nd item
list.remove_at(100)             # raises IndexError

# ---- Outputting the list -----

# to_s
list.to_s                      # returns string representation of the list

# ---- Today's Todos ----
# [ ] Buy milk
# [ ] Clean room
# [ ] Go to gym

# or, if any todos are done

# ---- Today's Todos ----
# [ ] Buy milk
# [X] Clean room
# [ ] Go to gym
=end
