require "byebug"
class PolyTreeNode
  
  def initialize(value = "new_node")
    @value = value
    @parent = nil
    @children = []
  end

  def parent
    @parent
  end
  
  def children
    @children
  end
  
  def value
    @value
  end
  
  def parent=(parent_node)
    if self.parent == nil
      @parent = parent_node
      parent_node.children << self
    else
      @parent.children.delete(self)
      @parent = parent_node
      parent_node.children << self unless parent_node.nil?
    end
  end
  
  def add_child(child_node)
    child_node.parent = self
  end
  
  def remove_child(child_node)
    raise "Not a child!" if child_node.nil?
    child_node.parent = nil
  end
  
  def dfs(target_value)
    return self if target_value == self.value
    self.children.each do |child|
      memo = child.dfs(target_value)
      return memo if memo
    end
    nil
  end
  
  def bfs(target_value)
    queue = [self]
    until queue.length == 0
      check_node = queue.shift
      if check_node.value == target_value
        return check_node
      else
        queue.concat(check_node.children)
      end
    end
    nil
  end
  
  # def inspect
  #   return "PolyTreeNode: #{self.value}, #{@parent}, #{@children}"
  # end
end