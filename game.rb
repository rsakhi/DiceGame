class DiceGame
  def initialize(no_of_players, score)
    @no_of_players = no_of_players.to_i
    @score = score.to_i
    @players = init_players
    @players_order = @players.shuffle
    @player_score = Hash[@players.product([0])]
    @rank = {}
    @rounds = 0
    @penalty = {}
    sleep(1)
  end

  def start
    errors = validate_input
    if errors.empty?
      puts "Dice Game is start with #{@no_of_players} players for point #{@score}"
      until @players_order.empty?
        @rounds += 1
        play
        print_rank
      end
    else
      puts errors.join(',')
    end
  end

  def final_result
    puts 'final result'
    puts 'total number of rounds #{@rounds}'
    puts "winner is #{@rank.first[0]}"
    puts 'Final Point table'
    puts @rank
  end

  private

  def validate_input
    error_msg = []
    error_msg.push('Number of players should be numaric and grater than or equal to 2') if @no_of_players < 2
    error_msg.push('Score should be numaric grater than or equal to 10') if @score < 10
    error_msg
  end

  def init_players
    (1..@no_of_players).map.with_index(1) { |_v, i| "player_#{i}" }
  end

  def play
    @players_order.each do |player|
      puts "#{player} is rolling dice"
      sleep 2
      point = role_dice
      puts "point scored is #{point}"
      # next if @penalty[player] >= 2
      if point == 1
        update_penalty(player)
      else
        @penalty[player] = 0
        @player_score[player] = @player_score[player] + point
        if @player_score[player] >= @score
          puts "Congratulations!!! #{player} You Have reached game point"
          @rank.merge!(player => @player_score[player])
          @players_order.delete(player)
        elsif point == 6
          puts "Congratulations!!! #{player} You got one more Chance to role the dice"
          redo
        end
      end
    end
  end

  def role_dice
    rand(1..6)
  end

  def update_penalty(player)
    if @penalty[player] == 1
      puts 'oops!! You got 1 again, You can\'t role the dice in next round'
    else
      puts 'oops!! You got 1, Try again in next round'
    end
    @penalty[player] = @penalty[player] ? @penalty[player] + 1 : 1
  end

  def print_rank
    puts "--------------point table after round #{@rounds}---------"
    players_rank
    sleep 1
  end

  def players_rank
    sorted_rank = Hash[@player_score.sort_by { |_, v| -v }]
    players = Hash[@rank.merge(sorted_rank)].keys
    players.each.with_index(1) do |player, i|
      puts "#{player}: rank is #{i} with point #{@player_score[player]}"
    end
    puts "\n"
  end
end

puts 'Hello there'
puts 'Please enter number of players'
players = gets
puts 'Please enter final score'
score = gets

game = DiceGame.new(players, score)
game.start
game.final_result
