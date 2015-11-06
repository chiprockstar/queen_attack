class Queens
  attr_accessor :white, :black, :board
  MAXDIMENSION = 7

  def initialize(white: [0,3], black: [7,3])
    if white == black
      raise ArgumentError.new("Both Queens cannot be in the same position.")
    else
      @white = white
      @black = black
      @board = ""
    end
  end

  def to_s
    (0..MAXDIMENSION).each do |y|
      (0..MAXDIMENSION).each do |x|
        create_board(y, x)
      end
    end
    "#{@board}"
  end

  def attack?
    case attack_type
    when :row, :column, :diagonal
      true
    when :none
      false
    end
  end




  private

  def create_board(y, x)
    case evaluate_position(y, x)
    when :white
      place_char("W ")
    when :black
      place_char("B ")
    when :new_line
      place_char("_\n")
    when :underscore
      place_char("_")
    when :space
      place_char("_ ")
    end
  end

  def evaluate_position(y, x)
    if y == @white[0] && x == @white[1]
      :white
    elsif y == @black[0] && x == @black[1]
      :black
    elsif x == MAXDIMENSION && y != MAXDIMENSION
      :new_line
    elsif x == MAXDIMENSION && y == MAXDIMENSION
      :underscore
    else
      :space
    end
  end

  def place_char(char)
    @board += char
  end

  def attack_type
    if (@white[0] == @black[0])
      :row
    elsif (@white[1] == @black[1])
      :column
    elsif (@white[0] +  @black[0]) == (@white[1] +  @black[1])
      :diagonal
    elsif (@white[0] +  @black[1]) == (@white[1] +  @black[0])
      :diagonal
    else
      :none
    end
  end
end
