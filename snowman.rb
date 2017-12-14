class SnowmanGame
  attr_reader :word
  attr_reader :snowmanImage
  attr_accessor :wrongGuesses

  def initialize
    puts "Player 1 enter a word"
    @word = gets.chomp
    @wrongGuesses = 0
  end

  def displaySnowman
    @snowmanImage = File.read("snowman_image.txt")
    puts @snowmanImage
  end

  def displayBoard
    word_length = @word.length
    puts "\n"
    puts "__ " * word_length
  end

  def meltingMan(wrongGuesses)
    meltingMan = @snowmanImage.lines
    puts meltingMan.length-wrongGuesses
  end

  def processGuess!
    puts "Player 2 guess a letter"
    guess = gets.chomp
    if guess.length > 1
      puts "Please enter 1 letter"
      guess = gets.chomp
    end
    checkGuess(guess)
  end

  def checkGuess(guess)
    correctGuesses = []
    @word.split(//).each do |letter|
      if guess == letter
        correctGuesses << letter
      else
        @wrongGuesses += 1
      end
      puts correctGuesses
    end
    meltingMan(wrongGuesses)
  end


end


startGame = SnowmanGame.new
startGame.displaySnowman
# startGame.displayBoard
# startGame.guess
startGame.processGuess!
# startGame.meltingMan