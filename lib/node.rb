class Node
  attr_accessor :data
  attr_accessor :next

  def initialize(data, next)
    @data = data
    @next = next
  end
end
