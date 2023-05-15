require_relative './lib/linked_list'

my_list = LinkedList.new(0)
my_list.append(1)
my_list.prepend(2)
puts "head: #{my_list.head.value}"
puts "tail: #{my_list.tail.value}"
puts "size: #{my_list.size}"
puts "at(0): #{my_list.at(0).value}"
puts "at(1): #{my_list.at(1).value}"
puts "at(2): #{my_list.at(2).value}"
puts "to_s: #{my_list.to_s}"
puts "contains?(0): #{my_list.contains?(0)}"
puts "contains?(1): #{my_list.contains?(1)}"
puts "contains?(8): #{my_list.contains?(8)}"
puts "find(1): #{my_list.find(1)}"
puts "find(2): #{my_list.find(2)}"
puts "pop: #{my_list.pop.value}"
puts "pop: #{my_list.pop.value}"
puts "pop: #{my_list.pop.value}"
