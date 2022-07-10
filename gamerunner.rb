require './gameboard.rb'

array = ["$", "a", "#", " ", "w"]

board = Gameboard.new(4, array)

 board.grid.each do |row|
   p row
 end
