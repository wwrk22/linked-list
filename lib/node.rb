class Node
  attr_accessor :data
  attr_accessor :next_node

  def initialize(data=nil, next_node=nil)
    @data = data
    @next_node = next_node
  end
end
