class Sodoku
  # Takes a 81 chars grid read top left to bottom right (0.- if square empty)
  # eg '..3.2.6..9..3.5..1..18.64....81.29..7.......8..67.82....26.95..8..2.3..9..5.1.3..'
  def initialize(grid)
    populate_board_from grid
  end
  
  def populate_board_from(grid)
    board.keys.sort.each_with_index do |square, index|
      number = grid.split(//)[index]
      board[square] = number.match(/\d{1}/) ? number : "123456789"
    end
  end
  
  def board
    @board ||= ('a'..'i').inject({}) do |hash,column|
      ('1'..'9').each {|row| hash["#{column}#{row}"] = nil }
      hash
    end
  end
  
  def row(square)
    board.keys.grep /#{square[/\d$/]}/
  end
  
  def column(square)
    board.keys.grep /#{square[/^\w/]}/
  end
  
  def box(square)
    boxes.find {|b| b.include? square }
  end
  
  def boxes
    @boxes ||= [('a'..'c'), ('d'..'f'), ('g'..'i')].map do |col|
      [ (1..3), (4..6), (7..9) ].map do |row|
        col.map do |c|
          ([c] * 3).zip(row.to_a).map {|s| s[0] + s[1].to_s }
        end.flatten
      end
    end.inject([]) {|boxes, box| boxes + box }
  end
  
  def peers(square)
    ( row(square) + column(square) + box(square) ).uniq
  end
  
  def solution
  end
end