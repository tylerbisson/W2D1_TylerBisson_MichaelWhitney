require_relative "piece"
require "byebug"
class Board 
    attr_accessor :board
    def initialize
        @board = Array.new(8) {Array.new(8) {NullPiece.new}}
        @board[0].map! {|space| space = Piece.new}
        @board[1].map! {|space| space = Piece.new("pawn")}
        @board[6].map! {|space| space = Piece.new("pawn")}
        @board[7].map! {|space| space = Piece.new}
    end

    
    def [](pos)
        row, col = pos
        self.board[row][col]
    end
    
    def []=(pos, piece)
        row, col = pos
        self.board[row][col] = piece
    end
    def move_piece(start_pos, end_pos)
        # debugger
        raise "there is no piece at start_pos" if self[start_pos].type.nil?
        raise "the piece cannot move to end_pos" unless self[end_pos].type.nil?
        self[end_pos] = self[start_pos] 
        self[start_pos] = NullPiece.new
    end
    
    def add_piece(piece, pos)
        board[pos] = piece
    end



end