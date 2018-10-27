class KnightPathFinder
  attr_accessor :root_node
  
  def initialize(pos = [0,0])
    @pos = pos
    @root_node = PolyTreeNode.new(pos)
    build_move_tree
    @visited_positions = [pos] 
  end
  
  def self.valid_moves(pos)
    
  end
  
  def build_move_tree
    
  end
  
  def find_path(pos)
    
  end
  
  
end