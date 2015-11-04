class Queens
  attr_accessor :white, :black, :board_grid
  DIMENSION = 7

  def initialize(white: [0,3], black: [7,3])
    if white == black
      raise ArgumentError.new("Both Queens cannot be in the same position")
    else
      @white = white
      @black = black
    end
  end

  def to_s
    board_grid = ""
    (0..DIMENSION).each do |y|
      (0..DIMENSION).each do |x|
        if y == @white[0] && x == @white[1]
          board_grid = board_grid + "W "
        elsif y == @black[0] && x == @black[1]
          board_grid = board_grid + "B "
        elsif x == DIMENSION && y != DIMENSION
          board_grid = board_grid + "_\n"
        elsif x == DIMENSION && y == DIMENSION
          board_grid = board_grid + "_"
        else
          board_grid = board_grid + "_ "
        end
      end
    end
    @board_grid = board_grid
  end

  def attack?
    return true if (@white[0] == @black[0]) || (@white[1] == @black[1])
    return true if (@white[0] +  @black[0]) == (@white[1] +  @black[1])
    return true if (@white[0] +  @black[1]) == (@white[1] +  @black[0])
    return false
  end


end
