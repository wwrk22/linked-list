require_relative './lib/linked_list'

my_list = LinkedList.new(0)
my_list.append(1)
my_list.prepend(2)
puts "head: #{my_list.head.value}"
puts "tail: #{my_list.tail.value}"
puts "size: #{my_list.size}"
puts "at(2): #{my_list.at(2)}"
puts "to_s: #{my_list.to_s}"
puts "contains?(0): #{my_list.contains?(0)}"
puts "find(1): #{my_list.find(1)}"
puts "pop: #{my_list.pop.value}"
puts "pop: #{my_list.pop.value}"
puts "pop: #{my_list.pop.value}"
