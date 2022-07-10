# grid setup x by x
require 'pry'
class Gameboard
  attr_reader :grid
  def initialize(edge, markers)
    #track size
    @edge = edge
    # track inital marker set
    @markers = markers
    # marker set without treasure
    @treasureless = markers.drop(1)
    # stores the finished grid
    @grid = gridmaker
    # checks the grid for adjacent treasure
    checker
  end

  def checker
    #itterate each row and track index of row
    @grid.each_with_index do |row, row_index|
      #itterate each cell and track index of each cell
      row.each_with_index do |cell, cell_index|
        # is cell a treasure
        if cell == "$"
          # am in in the top row? top row and any position besides first
          if row_index < 1 && cell_index > 0
            #do i match the cell to my left
            if cell == row[cell_index - 1]
              # if we match, replace me with one that is not a treasure
                row[cell_index] = @treasureless.sample
            end
            # all rows beyond top
          elsif row_index > 0
            # first position in row
            if cell_index == 0
              # check up one and to the right one
              if cell == @grid[row_index - 1][cell_index] ||  cell == @grid[row_index - 1][cell_index + 1]
                  row[cell_index] = @treasureless.sample
              end
              # am i in the middle of the array
            elsif cell_index < @edge - 1
              # do i match to my left up, or either up diagnal?
              if cell == row[cell_index - 1] || cell == @grid[row_index - 1][cell_index] ||  cell == @grid[row_index - 1][cell_index + 1]||  cell == @grid[row_index - 1][cell_index - 1]
                row[cell_index] = @treasureless.sample
              end
              # am I on the edge right most edge of the array?
            elsif cell_index == @edge - 1
              # do i match left, or up, or up and left?
              if cell == row[cell_index - 1] || cell == @grid[row_index - 1][cell_index] || cell == @grid[row_index - 1][cell_index - 1]
                row[cell_index] = @treasureless.sample
              end
            end
          end
        end
      end
    end
    #loop all rows, x
      #loop all columns, y
        # does have a treasure?
          # where can we look,
          # do those posistions have treaure,
            # they have treasure, change my maker
  end

    # array of arrays
    def rowmaker
      row = []
      @edge.times do
        row << @markers.sample
      end
      row
    end

    def gridmaker
      grid = []
      @edge.times do
         grid << rowmaker
      end
      grid
    end
  end
