require 'singleton'
require_relative 'stepable'
require_relative "slidable"
class Piece 
    attr_reader :color, :position, :board

    def initialize(color, pos, board)
        @color = color
        @position = pos
        @board = board
    end

end

class Knight < Piece 
    include Stepable
    attr_reader :strategy
    def initialize(color, pos, board)
        super
        @strategy = [
            [-1,2],
            [1,2],
            [-1,-2],
            [1,-2],
            [2, 1],
            [2,-1],
            [-2, 1],
            [-2, -1]]
    end
end

class Rook < Piece
    include Slidable
    def initialize(color, pos, board)
        super
        @strategy = :HV
    end
end

class King < Piece
    include Stepable

    def initialize(color, pos, board)
        super
        @strategy = [
            [0,1],
            [0,-1],
            [1,1],
            [1,-1],
            [-1,1],
            [1,0],
            [-1,0],
            [-1,-1]
        ]
    end
end

class NullPiece < Piece 
    include Singleton 
    def initialize
        super(nil, nil, nil)
    end
end


