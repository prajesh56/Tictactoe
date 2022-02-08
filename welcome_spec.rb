require './welcome'
require 'rspec'
describe Game do
    it "should create a new game" do
        object = Game.new(1)
        expect(object.class).to eql(Game)
    end
    describe "#game_over" do
        it "should return if game is over or not" do
            object = Game.new(1)
            board = %w(o o x x o x x x o)
            expect(object.game_over(board)).to be(true)
        end
    end
    describe "#valid_position" do
        it "should return position choosen is valid or not" do
            object = Game.new(1)
            #@board = ["o", "x", "x", "o", "x", "x", "x", "o", " "]
            position = 8
            expect(object.valid_position(position)).to be(true)
        end
    end
end