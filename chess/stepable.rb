module Stepable
    def moves #(strategy, position)
        @possible_moves = []
        x, y = position
        strategy.each do |move|
            a, b = move[0], move[1]
            pos = [x + a, y + b]
            unless pos[0] < 0 || pos[1] < 0 || board[pos].nil? || board[pos].color == self.color
                @possible_moves << pos
            end
        end
        @possible_moves
    end
end