require 'io/console'

puts "+-------------------------------+"
puts "|       *               *   *   |"
puts "|    *     *                *   |"
puts "|   *     *       *      *      |"
puts "|            Snowman            |"
puts "|       *               *   *   |"
puts "|   *          *               *|"
puts "|       *               *   *   |"
puts "+-------------------------------+"

VALID_GUESSES = ['A','B','C','D','E','F','G','H','I','J','K','L','M','N','O',
                'P','Q','R','S','T','U','V','W','X','Y','Z'].freeze
$snowman_height = 16.freeze
$num_guesses = 0
characters_to_match = []
guesses = []

f = File.readlines('snowman_image.txt')
#puts f
#puts f.size
#puts f[0]
#puts f[3]

print "Enter secret word: "
secret_word = STDIN.noecho(&:gets).chomp
puts "\n"
secret_word = secret_word.upcase
#puts "Word is: " + secret_word
characters_to_match = secret_word.split("").uniq

#puts "Unique characters: "
#characters_to_match.each do |c|
#  puts c
#end

while $num_guesses <= 0
  puts "How many guesses? (Must be greater than 0) "
  $num_guesses = gets.to_i
end
puts "Number of Guesses: " + $num_guesses.to_s

def print_snowman(f, rows_melted=0)

  hat_height = 4
  meltable_rows = f.size - hat_height
  # display hat
  (0..hat_height-1).each do |i|
    puts f[i]
  end
  snowman_top = hat_height + rows_melted * $snowman_height.fdiv($num_guesses).ceil
  (snowman_top..f.size-1).each do |i|
    puts f[i]
  end
  puts "\n"
end

#print_snowman(f, 0)
#print_snowman(f, 2)
#print_snowman(f, 4)
#print_snowman(f, 6)
#print_snowman(f, 8)

remaining_guesses = $num_guesses
successful_guesses = 0

#print_snowman(f)


while remaining_guesses >= 0
print_snowman(f, $num_guesses-remaining_guesses)

print "GUESSED: "
(0..guesses.length-1).each_with_index do |c, index|
  print guesses[index] + " "
end
print "\n"

print "WORD: "
(0..secret_word.length-1).each_with_index do |value, index|
  if guesses.include? secret_word[index]
    print secret_word[index]
  else
    print "_"
  end
  print " "
end
print "\n"

if remaining_guesses == 0
    puts "+-------------------------------+"
    puts "|       *               *   *   |"
    puts "|           You Lose!           |"
    puts "|   *     *       *      *      |"
    puts "|       *               *   *   |"
    print "|"
    ((30 - secret_word.length)/2).times do
      print " "
    end
    print secret_word
    ((30 - secret_word.length)/2).times do
      print " "
    end
    if secret_word.length.odd?
      print " "
    end
    puts " |"
    puts "|   *          *               *|"
    puts "|       *               *   *   |"
    puts "+-------------------------------+"
    break
  end
  if successful_guesses == characters_to_match.size
    puts "+-------------------------------+"
    puts "|       *               *   *   |"
    puts "|    *     *                *   |"
    puts "|   *     *       *      *      |"
    puts "|            Winner!            |"
    puts "|       *               *   *   |"
    puts "|   *          *               *|"
    puts "|       *               *   *   |"
    puts "+-------------------------------+"
    break
  end



#  puts "Remaining Guesses: " + remaining_guesses.to_s
  # receive a guess
  print "Guess? "
  guess = gets.chomp.upcase
  #puts "Guess is " + guess



  #puts "Guess is " + guesses[0]
  #puts VALID_GUESSES.include? guess
  puts "Is guess valid? " + (VALID_GUESSES.include? guess).to_s
  puts "Has guess been used? " + (guesses.include? guess).to_s
  puts "Is guess in word? " + (secret_word.include? guess).to_s
  # check if guess is valid
  if (VALID_GUESSES.include? guess) && !(guesses.include? guess)
    guesses.push(guess)
    guesses = guesses.sort
    if (secret_word.include? guess)
      # if guess is correct, reveal guess
      successful_guesses += 1
    else
      # if guess is incorrect, decrement remaining guesses
      remaining_guesses -= 1
#      print_snowman(f, $num_guesses-remaining_guesses)
    end
  end
  #guesses.each_with_index do |x, index|
  #  puts "Guess " + index.to_s + " is " + x
  #end

end
