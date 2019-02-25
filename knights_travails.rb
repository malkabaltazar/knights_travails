class Knight
  def move(node)
    column = node.value[0]; row = node.value[1]
    arr = [[column + 2, row - 1], [column + 2, row + 1], [column + 1, row - 2],
           [column + 1, row + 2], [column - 1, row - 2], [column - 1, row + 2],
           [column - 2, row - 1], [column - 2, row + 1]]
    nodes = []
    arr.each do |i|
      next unless (0..7) === i[0] && (0..7) === i[1]
      nodes.push(Node.new([i[0], i[1]], node))
    end
    nodes
  end

  def knight_moves(position, target, parent_node = position)
    return if position == target
    path = []
    queue = [Node.new(position)]
    queue.each do |i|
      if i.value == target
        until i.parent_node == nil
          path.unshift(i.value)
          i = i.parent_node
        end
        break
      else
        queue.push(*move(i))
      end
    end
    puts "You made it in #{path.length} moves! Here's your path:"
    puts "#{position}"
    path.each { |i| puts "#{i}" }
  end
end

class Node
  attr_accessor :value, :parent_node

  def initialize(value = nil, parent_node = nil)
    @value = value
    @parent_node = parent_node
  end
end

knight = Knight.new
knight.knight_moves([3,3],[4,3])
knight.knight_moves([0,0],[1,2]) #[[0,0],[1,2]]
knight.knight_moves([0,0],[3,3]) #[[0,0],[1,2],[3,3]]
knight.knight_moves([3,3],[0,0]) #[[3,3],[1,2],[0,0]]
