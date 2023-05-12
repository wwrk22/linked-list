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

  def pop
    last_node = @tail
    return nil if @head == nil
    return last_node if @head == @tail

    last_node = remove_last_node
    return last_node
  end

  def remove_last_node
    pop_proc = proc do |curr_node|
      return update_tail(curr_node) if curr_node.next_node == @tail
    end
    return traverse_list(&pop_proc)
  end

  # Set the tail to be 'new_tail' then return the old tail node.
  def update_tail(new_tail)
    old_tail = @tail
    @tail = new_tail
    return old_tail
  end

  def traverse_list(curr_node=@head)
    until curr_node == nil do
      yield curr_node
      curr_node = curr_node.next_node
    end
  end

  def to_s
    @str = ''
    to_s_proc = proc { |curr_node| @str += curr_node.value.to_s + ' ' }
    traverse_list(&to_s_proc)
    return @str
  end

  def at(search_index, curr_node=@head)
    until search_index == 0 || curr_node == nil do
      curr_node = curr_node.next_node
      search_index -= 1
    end

    return (curr_node == nil) ? nil : curr_node.value
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
