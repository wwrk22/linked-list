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
    at_proc = proc do |curr_node|
      return curr_node if search_index == 0
      search_index -= 1
    end

    return traverse_list(&at_proc)
  end

  def contains?(value)
    contains_proc = proc do |curr_node|
      return true if curr_node.value == value
    end

    traverse_list(&contains_proc) # Returns true here if found
    false
  end

  def find(value)
    index = -1

    find_proc = proc do |curr_node|
      index += 1
      return index if curr_node.value == value
    end

    traverse_list(&find_proc) # Returns index here if found
    return -1
  end

  def insert_at(value, index)
    insert_at_head(value) if index == 0

    insert_at_proc = proc do |curr_node|
      if index == 1
        new_node = Node.new(value, curr_node.next_node)
        curr_node.next_node = new_node
        return
      end

      index -= 1
    end

    traverse_list(&insert_at_proc)
  end

  def insert_at_head(value)
    new_head = Node.new(value, @head)
    @head = new_head
  end
end
