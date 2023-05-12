require_relative './node'

class LinkedList
  attr_accessor :head, :tail
  attr_reader :size

  def initialize(head_value=nil)
    @size = 0
    if head_value
      @head = @tail = Node.new(head_value)
      @size += 1
    end
  end

  def append(value)
    new_node = Node.new(value)
    @tail.next_node = new_node
    @tail = new_node
    @size += 1
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next_node = @head
    @head = new_node
    @size += 1
  end

  def at(search_index, curr_node=@head)
    until search_index == 0 || curr_node == nil do
      curr_node = curr_node.next_node
      search_index -= 1
    end

    return (curr_node == nil) ? nil : curr_node.value
  end

  def pop
    return nil if @head == nil

    curr_node, last_node = @head, @tail
    until curr_node.next_node == @tail || curr_node == @tail
      curr_node = curr_node.next_node
    end

    @tail = curr_node
    @tail.next_node = nil
    return last_node
  end

  def to_s
    str = ''
    curr_node = @head
    until curr_node == nil do
      str << curr_node.value.to_s + ' '
      curr_node = curr_node.next_node
    end

    str
  end

  def contains?(value)
    curr_node = @head

    until curr_node == nil do
      return true if curr_node.value == value
      curr_node = curr_node.next_node
    end
    
    false
  end

  def find(value)
    curr_node = @head
    index = -1

    until curr_node == nil do
      index += 1
      return index if curr_node.value == value
      curr_node = curr_node.next_node
    end

    index
  end
end
