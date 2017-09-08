family_tree = {
  'grandpa' => {
    'dad' => {
      'child 1' => {},
      'child 2' => {}
    },
    'uncle' => {
      'child 3' => {},
      'child 4' => {}
    }
  }
}

# p family_tree.to_a[0][0]
# p family_tree.to_a[0][1]

class Tree
  attr_accessor :children, :node_name

  def initialize(tree = {})
    @children = []

    tree.each do |name, children|
      @node_name = name

      children.each do |child_name, child_children|
        @children.push(Tree.new({child_name => child_children}))
      end
    end
  end

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end

  def visit(&block)
    block.call self
  end
end

ruby_tree = Tree.new(family_tree)

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "visiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}
