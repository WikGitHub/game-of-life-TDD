require './game'

describe 'Conways game of life constraints' do
    let(:live_cell_tracker) {Live_cell_tracker.new}
        subject { Cell.new(live_cell_tracker) }
        it "spawns cells" do
            cell = subject.spawn_cell_at_position( 1000 , 1000 ) 
            expect(cell.row).to eq(1000)
            expect(cell.column).to eq(1000)
            expect(cell.live_cell_tracker).to eq(subject.live_cell_tracker)
        end

    describe 'Neighbour coordinates' do     #remember, original cell starts at position 0,0
        it 'detect neighbour to the North' do
            cell = subject.spawn_cell_at_position( 0 , 1 )
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'detects neighbour to the East' do
            cell = subject.spawn_cell_at_position( 1 , 0 ) 
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'detects neighbour to the West' do
            cell = subject.spawn_cell_at_position( - 1 , 0 )
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'detects neighbour to the South' do
            cell = subject.spawn_cell_at_position( 1 , 0 )
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'detects neighbour to the North-East' do
            cell = subject.spawn_cell_at_position( 1 , 1 )
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'detects neighbour to the North-West' do
            cell = subject.spawn_cell_at_position( 1 , 1 )
            expect(subject.neighbouring_cells.count).to eq(1)
        end
    end

    describe 'Cell status' do
        it 'dies AND is no longer tracked' do
            subject.cell_dies
            expect(subject.live_cell_tracker.cells).not_to include(subject)
        end
    end

    describe 'Conways Game of Life rules' do
        it 'Live cell with <2 live neighbours dies' do
            cell = Cell.new(live_cell_tracker)
            new_cell = cell.spawn_cell_at_position( 2 , 0 )
            live_cell_tracker.evaluation_of_who_is_alive_and_dead
            expect(cell).to be_remove_from_live_cell_tracker
        end
        it 'Live cell with 2 or 3 live neighbours lives' do
            cell = Cell.new(live_cell_tracker)
            new_cell = cell.spawn_cell_at_position( 1 , 0 )
            other_new_cell = cell.spawn_cell_at_position( - 1 , 0 )
            live_cell_tracker.evaluation_of_who_is_alive_and_dead
            expect(cell).to be_cell_is_alive
        end
    end
end


=begin


TO DO
[] finish detecting neighbours to all the other directions with accompanying tests
[] finish rules
[] look up different matchers 


=end
