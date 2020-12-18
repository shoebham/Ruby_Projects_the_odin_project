class Node
    attr_accessor :left, :right, :data

    def initialize(data)
        @left = nil
        @right = nil
        @data = data
    end


end

class Tree
    attr_accessor :root, :data
    def initialize(array)
        @array = array
        @root = build_tree(array)
    end

    def build_tree(array)
        if array.empty?
            return nil
        end
        array.sort.uniq!
        middle = (array.size-1)/2
        root_node = Node.new(array[middle])

        root_node.left = build_tree(array[0...middle])

        root_node.right=build_tree(array[(middle+1)..-1])

        root_node
    end

    def insert(value,node=root)
        return nil if value == node.data
        if value < node.data
            node.left.nil? ? node.left = Node.new(value): insert(value,node.left)
        else
            node.right.nil? ? node.right = Node.new(value): insert(value,node.right)
        end
    end

    def delete(value,node=root)
        return node if node.nil?
        if value<root.data
            node.left = delete(value,node.left)
        elsif value>root.data
            node.right = delete(value,node.right)
        else
             return node.right if node.left.nil?
             return node.left if node.right.nil?

             left_node = left_leaf(node.right)                
             node.data = left_node.data
             node.right = delete(left.node.data,node.right)
        end
        node
    end

    def left_leaf(node)
        node = node.left until node.left.nil?
        node
    end

    
    def find(value,node=root)
        if node.nil? || node.data == value
            return node
        end
        value < node.data ? find(value,node.left):find(value,node.right)
    end


    def level_order(node=root,queue=[],result=[])
        result << node.data
        # puts "data is #{node.data}"
        queue << node.left unless node.left.nil?
        queue << node.right unless node.right.nil?
        if queue.empty?
            return
        end
        level_order(queue.shift,queue,result)
        result
    end

    def inorder(node=root,result=[])
        # left,root,right
        return result if node.nil?
        inorder(node.left,result)
        result << node.data
        # puts "data is #{node.data}"
        inorder(node.right,result)
        result
    end

    def preorder(node=root,result=[])
        # root,left,right
        return result if node.nil?
        result << node.data
        # puts "data is #{node.data}"
        preorder(node.left,result)
        preorder(node.right,result)
         result
    end

    def postoder(node=root,result=[])
        # left,right,root
        return result if node.nil?    
        postoder(node.left,result)
        postoder(node.right,result)
        # puts "data is #{node.data}"
        result << node.data
        result
    end

    def height(node = root)
        return -1 if node.nil?
        [height(node.left) , height(node.right)].max+1
    end
    
    def height_node(value)
        node = find(value)
        height(node)
    end
    
    def depth(value,node=root)
       height(root)-height(find(value)) 
    end

    def balanced?(node =root)
        return true if node.nil?

        left_height = height(node.left)
        right_height =height(node.right)

        return true if (left_height - right_height)<=1 && balanced?(node.left) && balanced?(node.right)
        false
    end

    def rebalance
        @root = build_tree(inorder)
    end

    def pretty_print(node = @root, prefix = '', is_left = true)
        pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
        puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
        pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
    end
    
      
end

array = Array.new(15){rand(100)}

binary_search_tree = Tree.new(array)
binary_search_tree.pretty_print
puts binary_search_tree.balanced? ? "Balanced" : "Not Balanced"
p binary_search_tree.level_order
p binary_search_tree.preorder
p binary_search_tree.postoder
p binary_search_tree.inorder

p "------Unbalancing the tree---------------"

10.times do 
    binary_search_tree.insert(rand(200..300))
end

p "--------After Unbalancing----------------"

binary_search_tree.pretty_print
puts binary_search_tree.balanced? ? "Balanced" : "Not Balanced"
puts "-------------------Rebalancing----------------------"

binary_search_tree.rebalance
puts binary_search_tree.balanced? ? "Balanced" : "Not Balanced"

binary_search_tree.pretty_print

puts "Level-order #{binary_search_tree.level_order}\n"
puts "Pre-order #{binary_search_tree.preorder}\n"
puts "Post-order #{binary_search_tree.postoder}\n"
puts "Inorder #{binary_search_tree.inorder}\n"
# array = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,100]
# tree =  Tree.new(array) 
# tree.pretty_print
# p tree.height
# p tree.depth(100)


