class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

# c1: recursion (class)
# class Solution
#     def initialize
#         @res = []
#     end

#     def inorder_traversal(root)
#         return @res if root.nil?

#         inorder_traversal(root.left)
#         @res.push(root.val)
#         inorder_traversal(root.right)

#         @res
#     end
# end

# c2: recursion (not class)
# def inorder_traversal(root)
#     res = []
#     helper(root, res)
#     res
# end
# def helper(root, res)
#     return res if root.nil?

#     helper(root.left, res)
#     res.push(root.val)
#     helper(root.right, res)
# end

# c3: 
def inorder_traversal(root)
    result = []
    return result if root.nil?
    stack = []
    cur = root

    while(!cur.nil? || !stack.empty?)
        while(!cur.nil?)
            stack.push(cur)
            cur = cur.left
        end
        cur = stack.pop
        result.push(cur.val)
        cur = cur.right
    end

    result
end

node1 = TreeNode.new(1, nil, nil)
node5 = TreeNode.new(5, nil, nil)
node4 = TreeNode.new(4, node1, node5)
node9 = TreeNode.new(9, nil, nil)
node15 = TreeNode.new(15, node9, nil)
node8 = TreeNode.new(8, node4, node15)
root = node8

# pp Solution.new.inorder_traversal(root)
pp inorder_traversal(root)
