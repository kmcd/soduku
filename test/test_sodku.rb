require 'helper'

class TestSodoku < Test::Unit::TestCase
  def easy_sodoku
    Sodoku.new '..3.2.6..9..3.5..1..18.64....81.29..7.......8..67.82....26.95..8..2.3..9..5.1.3..'
  end
  
  test "should solve easy problem" do
    assert_equal(
      %Q{
        4 8 3 |9 2 1 |6 5 7 
        9 6 7 |3 4 5 |8 2 1 
        2 5 1 |8 7 6 |4 9 3 
        ------+------+------
        5 4 8 |1 3 2 |9 7 6 
        7 2 9 |5 6 4 |1 3 8 
        1 3 6 |7 9 8 |2 4 5 
        ------+------+------
        3 7 2 |6 8 9 |5 1 4 
        8 1 4 |2 5 3 |7 6 9 
        6 9 5 |4 1 7 |3 8 2 
      }, easy_sodoku.solution)
  end
  
  test "should solve hard problem" do
    sodoku = Sodoku.new '4.....8.5.3..........7......2.....6.....8.4......1.......6.3.7.5..2.....1.4......'
    assert_equal(
      %Q{
        4 8 3 |9 2 1 |6 5 7 
        9 6 7 |3 4 5 |8 2 1 
        2 5 1 |8 7 6 |4 9 3 
        ------+------+------
        5 4 8 |1 3 2 |9 7 6 
        7 2 9 |5 6 4 |1 3 8 
        1 3 6 |7 9 8 |2 4 5 
        ------+------+------
        3 7 2 |6 8 9 |5 1 4 
        8 1 4 |2 5 3 |7 6 9 
        6 9 5 |4 1 7 |3 8 2 
      }, sodoku.solution)
  end
  
  test "should store board" do
    assert_equal({"h6"=>"3", "b3"=>"123456789", "d4"=>"1", "f5"=>"123456789", "h7"=>"123456789", "b4"=>"3", "d5"=>"123456789", "f6"=>"8", "h8"=>"123456789", "b5"=>"123456789", "d6"=>"2", "f7"=>"2", "h9"=>"9", "b6"=>"5", "d7"=>"9", "f8"=>"123456789", "i1"=>"123456789", "b7"=>"123456789", "d8"=>"123456789", "f9"=>"123456789", "i2"=>"123456789", "d9"=>"123456789", "g1"=>"123456789", "b8"=>"123456789", "i3"=>"5", "b9"=>"1", "e1"=>"7", "g2"=>"123456789", "i4"=>"123456789", "c1"=>"123456789", "e2"=>"123456789", "g3"=>"2", "i5"=>"1", "a1"=>"123456789", "c2"=>"123456789", "e3"=>"123456789", "g4"=>"6", "i6"=>"123456789", "a2"=>"123456789", "c3"=>"1", "e4"=>"123456789", "g5"=>"123456789", "i7"=>"3", "a3"=>"3", "c4"=>"8", "e5"=>"123456789", "g6"=>"9", "i8"=>"123456789", "a4"=>"123456789", "c5"=>"123456789", "e6"=>"123456789", "g7"=>"5", "i9"=>"123456789", "a5"=>"2", "c6"=>"6", "e7"=>"123456789", "g8"=>"123456789", "a6"=>"123456789", "c7"=>"4", "e8"=>"123456789", "g9"=>"123456789", "c8"=>"123456789", "e9"=>"8", "h1"=>"8", "a7"=>"6", "h2"=>"123456789", "a8"=>"123456789", "c9"=>"123456789", "f1"=>"123456789", "a9"=>"123456789", "d1"=>"123456789", "f2"=>"123456789", "h3"=>"123456789", "h4"=>"2", "b1"=>"9", "d2"=>"123456789", "f3"=>"6", "h5"=>"123456789", "b2"=>"123456789", "d3"=>"8", "f4"=>"7"}, easy_sodoku.board)
  end
  
  test "should find a squares peers" do
    assert_equal(["i1", "g1", "e1", "c1", "a1", "h1", "f1", "d1", "b1", "a2", "a3", "a4", "a5", "a6", "a7", "a8", "a9", "b2", "b3", "c2", "c3"], easy_sodoku.peers('a1'))
  end
  
end
