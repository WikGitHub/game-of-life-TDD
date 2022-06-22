
class Cell
    attr_accessor :world, :row, :column

    def initialize(world, row = 0, column = 0)
        @row = row
        @column = column
        @world = world
        world.cells << self
    end

    def cell_is_alive?
        !remove_from_world?
    end

    def spawn_at(row, column)
        Cell.new(world, row, column)
    end

    def neighbouring_cells
        @neighbouring_cells = []
        world.cells.each do |cell|
            if self.row == cell.row && self.column == cell.column - 1
                @neighbouring_cells << cell
            elsif
             self.row == cell.row - 1 && self.column == cell.column - 1
                @neighbouring_cells << cell
            elsif
                self.row == cell.row - 1 && self.column == cell.column 
                @neighbouring_cells << cell
            elsif 
                self.row == cell.row + 1 && self.column == cell.column 
                @neighbouring_cells << cell
            end
        end
        @neighbouring_cells
    end
#remember for the above, think of NEW cell (self), then OG (cell)

    def cell_dies
        world.cells -= [self]
    end

    def remove_from_world?
        !world.cells.include?(self)
    end
end



class World
    attr_accessor :cells

    def initialize
        @cells = []
    end

    def tick!
        cells.each do |cell|
            if cell.neighbouring_cells.count < 2
                cell.cell_dies
            end
        end
    end
end






/
IMPORTANT NOTES 

-1 IS NOT THE SAME AS - 1

/