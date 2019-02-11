class Piece 
    attr_reader :type
    def initialize(type = 1)
        @type = type
    end
end

class NullPiece < Piece 
    def initialize 
        super(nil)
    end
end