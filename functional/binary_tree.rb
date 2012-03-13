class TreeNode
    # binary tree representation
    attr_accessor :value, :left, :right

    def initialize(value=nil, left=nil, right=nil)
        @value, @left, @right = value, left, right
    end
end

class Tree

    def initialize(root, &comp)
        @root = root
        @comp = comp
    end

    def insert(node, v)
        # binary tree insert without balancing,
        # block performs the comparison operation
        return TreeNode.new(v) if not node
        case @comp[v, node.value]
            when -1
                node.left = insert(node.left, v)
            when 1
                node.right = insert(node.right, v)
        end
        return node
    end
end

comparison = lambda{|a, b| a > b ? -1 : 1}
tree = Tree.new(TreeNode.new(10, comparison))
tree.insert(2)
tree.insert(3)