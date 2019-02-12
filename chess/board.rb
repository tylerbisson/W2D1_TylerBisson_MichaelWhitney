require_relative "piece"
require "byebug"
class Board 
    attr_accessor :grid
    def initialize
        @grid = Array.new(8) {Array.new(8) {NullPiece.instance}}
        @grid[0].map!.with_index {|space, i| space = Piece.new(:b, [0, i], self)}
        self[[0,1]] = Knight.new(:b, [0,1], self)
        self[[0,4]] = King.new(:b, [0,4], self)
        self[[0,6]] = Knight.new(:b, [0,6], self)        
        @grid[1].map!.with_index {|space, i| space = Piece.new(:b, [1, i], self)}
        @grid[6].map!.with_index {|space, i| space = Piece.new(:w, [6, i], self)}
        @grid[7].map!.with_index {|space, i| space = Piece.new(:w, [7, i], self)}
        self[[7,1]] = Knight.new(:w, [7,1], self)
        self[[7,4]] = King.new(:w, [7,4], self)
        self[[7,6]] = Knight.new(:w, [7,6], self)                

    end

    
    def [](pos)
        row, col = pos
        self.grid[row][col]
    end
    
    def []=(pos, piece)
        row, col = pos
        self.grid[row][col] = piece
    end

    def move_piece(start_pos, end_pos)
        # debugger
        raise "there is no piece at start_pos" if self[start_pos].is_a?(NullPiece)
        # raise "the piece cannot move to end_pos" unless self[end_pos].type.nil?
        self[end_pos] = self[start_pos] 
        self[start_pos] = NullPiece.instance
    end
    
    def add_piece(piece, pos)
        grid[pos] = piece
    end

    def valid_pos?(pos)
        raise "Invalid position" if self[pos].nil?
        return true 
    end


end