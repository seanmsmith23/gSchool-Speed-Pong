players = []
scoreboard = {}

done = false

until done == true
  puts "Who is playing? Enter 'DONE' when you are finished."
  saved = gets.chomp
  if saved != "DONE"
    players << saved
  end
  done = true if saved == "DONE"
end

shuffled_players = players.shuffle
shuffled_players.each{ |player| scoreboard[player] = 0 }
sorted_scores = scoreboard.sort_by { |key, value| value }.reverse.flatten

until sorted_scores[1] == 10
  one = shuffled_players.shift
  two = shuffled_players.shift
  three = shuffled_players[0]

  puts "\n\nNext game: #{one} vs. #{two} -- #{three} is on deck. \n\n"
  puts "Put '1' if #{one} won, put '2' if #{two} won."
  result = gets.chomp

  if result == "1"
    scoreboard[one] += 1
    shuffled_players.unshift(one)
    shuffled_players << two
  elsif result == "2"
    scoreboard[two] += 1
    shuffled_players.unshift(two)
    shuffled_players << one
  else puts "Try again. Last chance. Put '1' if #{one} won, put '2' if #{two} won."
    if result == "1"
      scoreboard[one] += 1
      shuffled_players.unshift(one)
      shuffled_players << two
    elsif result == "2"
      scoreboard[two] += 1
      shuffled_players.unshift(two)
      shuffled_players << one
    else
      puts "I TOLD YOU THAT WAS THE LAST CHANCE"
      break
    end
  end

  sorted_scores = scoreboard.sort_by { |key, value| value }.reverse.flatten

  puts "First: #{sorted_scores[0]} with: #{sorted_scores[1]} wins"
  puts "Second: #{sorted_scores[2]} with: #{sorted_scores[3]} wins"
end

puts "FINAL SCORES"
scoreboard.each{|k,v| p "#{k}: #{v}" }
