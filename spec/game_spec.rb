require './game'


describe 'game of life' do
    let(:live_cell_tracker) {Live_cell_tracker.new}
    context 'cell utility methods' do
        subject { Cell.new(live_cell_tracker) }
        it "spawns cells" do
            cell = subject.spawn_cell_at_position(3,5)
            #cell.is_a?(Cell).should be_true
            expect(cell.row).to eq(3)
            expect(cell.column).to eq(5)
            #cell.live_cell_tracker.should == subject.live_cell_tracker
            expect(cell.live_cell_tracker).to eq(subject.live_cell_tracker)
        end
        it 'detects neighbour to N' do
            cell = subject.spawn_cell_at_position(0,1)
            #subject.neighbouring_cells.count.should == 1
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'detects neighbour to NE' do
            cell = subject.spawn_cell_at_position(1,1)
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'detects neighbour to E' do
            cell = subject.spawn_cell_at_position(1,0)
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'detects neighbour to W' do
            cell = subject.spawn_cell_at_position(-1,0)
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'dies' do
            subject.cell_dies
            #subject.live_cell_tracker.cells.should_not include(subject)
            expect(subject.live_cell_tracker.cells).not_to include(subject)
        end
    end
    it 'rule 1' do
        cell = Cell.new(live_cell_tracker)
        #cell.neighbouring_cells.count.should == 0
        new_cell = cell.spawn_cell_at_position(2,0)
        live_cell_tracker.evaluation_of_who_is_alive_and_dead
        expect(cell).to be_remove_from_live_cell_tracker
    end
    it 'rule 2' do
        cell = Cell.new(live_cell_tracker)
        new_cell = cell.spawn_cell_at_position(1,0)
        other_new_cell = cell.spawn_cell_at_position(-1, 0)
        live_cell_tracker.evaluation_of_who_is_alive_and_dead
        expect(cell).to be_cell_is_alive
    end
end

#remeber, original cell starts at position 0,0