
class Cell
    attr_accessor :live_cell_tracker, :row, :column

    def initialize(live_cell_tracker, row = 0, column = 0)
        @row = row
        @column = column
        @live_cell_tracker = live_cell_tracker
        live_cell_tracker.cells << self
    end

    def cell_is_alive?
        !remove_from_live_cell_tracker?
    end

    def spawn_cell_at_position(row, column)
        Cell.new(live_cell_tracker, row, column)
    end

    def neighbouring_cells
        @neighbouring_cells = []
        live_cell_tracker.cells.each do |cell|
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
        live_cell_tracker.cells -= [self]
    end

    def remove_from_live_cell_tracker?
        !live_cell_tracker.cells.include?(self)
    end
end



class Live_cell_tracker
    attr_accessor :cells

    def initialize
        @cells = []
    end

    def evaluation_of_who_is_alive_and_dead
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