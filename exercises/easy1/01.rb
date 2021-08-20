=begin
- Outline a Tree class so that it can support the methods of Enumerable
- i.e. each, map, reduce, select, etc

Enumerable:
- traversal, searching, sorting
- classes mixin in Enumerable must provide an each method
  - should "yield successive members of the collection"
- for sorting (max, min, sort, etc), implement a <=>

Binary Tree:
- tree data structure in which each node has at max two children
ABCD -> AB -> A
           -> B
     -> CD -> C
           -> D

=end

class Tree
  include Enumerable

  def each
    # iterate through collection, yield each element to given block
  end

  def <=>
    # assign meaningful values for comparison
  end
end