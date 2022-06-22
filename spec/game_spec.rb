require './game'


describe 'game of life' do
    let(:world) {World.new}
    context 'cell utility methods' do
        subject { Cell.new(world) }
        it "spawns cells" do
            cell = subject.spawn_at(3,5)
            #cell.is_a?(Cell).should be_true
            expect(cell.row).to eq(3)
            expect(cell.column).to eq(5)
            #cell.world.should == subject.world
            expect(cell.world).to eq(subject.world)
        end
        it 'detects neighbour to N' do
            cell = subject.spawn_at(0,1)
            #subject.neighbouring_cells.count.should == 1
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'detects neighbour to NE' do
            cell = subject.spawn_at(1,1)
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'detects neighbour to E' do
            cell = subject.spawn_at(1,0)
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'detects neighbour to W' do
            cell = subject.spawn_at(-1,0)
            expect(subject.neighbouring_cells.count).to eq(1)
        end
        it 'dies' do
            subject.cell_dies
            #subject.world.cells.should_not include(subject)
            expect(subject.world.cells).not_to include(subject)
        end
    end
    it 'rule 1' do
        cell = Cell.new(world)
        #cell.neighbouring_cells.count.should == 0
        new_cell = cell.spawn_at(2,0)
        world.tick!
        expect(cell).to be_remove_from_world
    end
    it 'rule 2' do
        cell = Cell.new(world)
        new_cell = cell.spawn_at(1,0)
        other_new_cell = cell.spawn_at(-1, 0)
        world.tick!
        expect(cell).to be_cell_is_alive
    end
end

#remeber, original cell starts at position 0,0