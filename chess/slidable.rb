module Slidable
    def moves(strategy, position)
        @possible_moves = []
        x, y = position
        case strategy
        when :HV
            b = y + 1
            until grid[x][b] == nil || grid[x][b].color == self.color
                @possible_moves << [x,b]
                b += 1
            end
            b = y - 1
            until grid[x][b] == nil || grid[x][b].color == self.color
                @possible_moves << [x,b]
                b -= 1
            end
            a = x + 1
            until grid[a][y] == nil || grid[a][y].color == self.color
                @possible_moves << [a,y]
                a += 1
            end
            a = x - 1
            until grid[a][y] == nil || grid[a][y].color == self.color
                @possible_moves << [a,y]
                a -= 1
            end
        when :D 

        end
    end


end
