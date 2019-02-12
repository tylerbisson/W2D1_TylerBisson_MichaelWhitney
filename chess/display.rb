require "colorize"
require_relative "cursor"
require_relative "board"

class Display 
    attr_accessor :board, :cursor
    def initialize()
        @board = Board.new 
        @cursor = Cursor.new([0,0], board)
    end

    def render
        print "   1  2  3  4  5  6  7  8\n"
        (0..7).each do |row|
            print "#{row+1} "
            (0..7).each do |col|
                pos = [row, col]
                if pos == cursor.cursor_pos 
                    print " * ".colorize(:green)
                elsif board[pos].type == nil
                    print "   "
                else
                    print " B "
                end
            end
            print "\n"
        end
        # board[cursor.cursor_pos].colorize(:red)
    end

    def loop_render
        system("clear")
        self.render
        #loop continues until :enter is pushed and pos is returned
        until cursor.get_input == "quit loop"
            system("clear")
            self.render 
        end
    end
end