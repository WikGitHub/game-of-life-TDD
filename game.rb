
class Cell
    attr_accessor :world, :x, :y

    def initialize(world, x = 0, y = 0)
        @x = x
        @y = y
        @world = world
        world.cells << self
    end

    def die!
        world.cells -= [self]
    end

    def dead?
        !world.cells.include?(self)
    end

    def alive?
        !dead?
    end




    def neighbours
        @neighbours = []
        world.cells.each do |cell|
            if self.x == cell.x && self.y == cell.y - 1
                @neighbours << cell
            elsif
             self.x == cell.x - 1 && self.y == cell.y - 1
                @neighbours << cell
            elsif
                self.x == cell.x - 1 && self.y == cell.y 
                @neighbours << cell
            elsif 
                self.x == cell.x + 1 && self.y == cell.y 
                @neighbours << cell
            end
        end
        @neighbours
    end
#remember for the above, think of NEW cell (self), then OG (cell)



    def spawn_at(x, y)
        Cell.new(world, x, y)
    end
end



class World

    attr_accessor :cells

    def initialize
        @cells = []
    end

    def tick!
        cells.each do |cell|
            if cell.neighbours.count < 2
                cell.die!
            end
        end
    end



end






/
IMPORTANT NOTES 

-1 IS NOT THE SAME AS - 1

/