require 'todo'

RSpec.describe "Todo" do
    context "initialize" do

        it "creates array, adds item to it" do
            newtask = Todo.new("New task")
            expect(newtask.task).to eq "New task"
        end

        it 'returns true if task is done' do
            newtask = Todo.new("Clean car")
            newtask.mark_complete
            expect(newtask.complete?).to eq true
        end

        it "returns false if task isn't done" do
            newtask = Todo.new("Hoover the roof")
            expect(newtask.complete?).to eq false
        end
    end
end