
class Cell
    attr_accessor :world, :row, :column

    def initialize(world, row = 0, column = 0)
        @row = row
        @column = column
        @world = world
        world.cells << self
    end

    def cell_dies
        world.cells -= [self]
    end

    def remove_from_world?
        !world.cells.include?(self)
    end

    def alive?
        !remove_from_world?
    end




    def neighbours
        @neighbours = []
        world.cells.each do |cell|
            if self.row == cell.row && self.column == cell.column - 1
                @neighbours << cell
            elsif
             self.row == cell.row - 1 && self.column == cell.column - 1
                @neighbours << cell
            elsif
                self.row == cell.row - 1 && self.column == cell.column 
                @neighbours << cell
            elsif 
                self.row == cell.row + 1 && self.column == cell.column 
                @neighbours << cell
            end
        end
        @neighbours
    end
#remember for the above, think of NEW cell (self), then OG (cell)



    def spawn_at(row, column)
        Cell.new(world, row, column)
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
                cell.cell_dies
            end
        end
    end
end






/
IMPORTANT NOTES 

-1 IS NOT THE SAME AS - 1

/