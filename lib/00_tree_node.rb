class PolyTreeNode
    attr_reader :value, :children, :parent
   def initialize(value)
    @value = value
    @children = []
    @parent = nil
   end 


    def parent=(new_parent)

        if new_parent ==nil 
            @parent.children.delete(self)
            @parent = nil
            return 
        end 

            if @parent.nil?
                @parent = new_parent

            else
                @parent.children.delete(self)
                @parent = new_parent
            end 

            unless new_parent.children.include?(self)
                new_parent.children << self
            end

        

    end 


    def add_child(child_node)
        child_node.parent=(self)
    end 

    def remove_child(child_node)
        child_node.parent=(nil)
    end 

    # def dfs(target = nil, &prc)
    #     raise "Need a proc or target" if [target, prc].none?
    #     prc ||= Proc.new { |node| node.value == target }
    
    #     return self if prc.call(self)
    
    #     children.each do |child|
    #       result = child.dfs(&prc)
    #       return result unless result.nil?
    #     end
    
    #     nil
    #   end

    


end