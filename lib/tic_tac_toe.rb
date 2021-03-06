# require 'pry'
class TicTacToe
  def initialize(board = [" "," "," "," "," "," "," "," "," "])
    @board = board
  end

  def board
    @board
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]

  def move(input, token)
    index = input_to_index(input)
    @board[index] = token
  end

#THIS METHOD IS BEING PASSED AN INTEGER
  def position_taken?(location)
    @board[location] != " " && board[location] != ""
  end

#THIS METHOD IS BEING PASSED A STRING
  def valid_move?(input)
    index = input_to_index(input)
    index.between?(0,8) && !position_taken?(index)
  end


  def turn
      puts "Please enter 1-9:"
      input = gets.strip
      # index = input_to_index(input)
      if valid_move?(input)
        token = current_player
        move(input, token)
        display_board
      else
        turn
      end
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def won?
      WIN_COMBINATIONS.each do |win_combination|

      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = @board[win_index_1]
      position_2 = @board[win_index_2]
      position_3 = @board[win_index_3]

      if position_1 == "X" && position_2 == "X" && position_3 == "X"
         return win_combination
      elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combination
      else
        false
      end
    end

      if @board.all? do |string|
        string == "" || string == " "
        return false
      end
    end
  end

  def current_player
    turn_count % 2 == 0 ? "X" : "O"
  end

  def turn_count
    @board.count{|token| token == "X" || token == "O"}
  end

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def over?
    if draw? || won? || full?
       true
    else
       false
    end
  end

  def draw?
    if !won? && full?
       true
    else
       false
    end
  end


  def full?
    @board.all? do |space|
      space == "X" || space == "O"
      end
  end

def winner
  if won?
    combination = won?
    position = combination[1]
    @board[position]
  else
     nil
  end
end

def play
  until over?
    turn
  end

  if won?
    puts "Congratulations #{winner}!"
  elsif draw?
    puts "Cats Game!"
  end
end
end

# binding.pry
