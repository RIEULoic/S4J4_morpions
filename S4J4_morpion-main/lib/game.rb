require_relative 'player'
require_relative 'board'

class Game
  #TO DO : la classe a plusieurs attr_accessor: le current_player (égal à un objet Player), le status (en cours, nul ou un objet Player s'il gagne), le Board et un array contenant les 2 joueurs.
  attr_accessor :player1, :player2
  attr_accessor :board

  @timer
  @timerMax

  def initialize
    #TO DO : créé 2 joueurs, créé un board, met le status à "on going", défini un current_player
    @player1 = Player.new("AAA", "O")
    @player2 = Player.new("AAA", "X")
    @board = Board.new
    @timer = 0
    @timerMax = 10
  end

  def new_game
    end_game = false
    while !end_game
      turn
      end_game = true;
    end
  end

  def presentation
    puts "Les joueurs sont :"
    puts player1.name + " : " + player1.glyph
    puts player2.name + " : " + player2.glyph
  end

  def ask_player_name(numberPlayer)
    uncheck = true
    name_player = ""
    while uncheck
      puts "[JOUEUR n° #{numberPlayer} ] Entrez votre nom :"
      name_player = gets.chomp
      if !name_player.empty?
        if numberPlayer == 1
          player1.name = name_player
        else
          player2.name = name_player
        end
        uncheck = false
      end
    end
  end

  def turn
    ask_player_name(1)
    ask_player_name(2)
    presentation                
    @timer = 1
    victory = false
    finalTimer = false
    check = false
    while !check
      puts "[ TIMER N° #{@timer} ] - Tour du joueur (1)"
      ask_player_turn(1)
      @timer += 1
      victory = board.check_victory?(player1.glyph)
      finalTimer = get_final_timer?
      if victory
        puts "Victoire du joueur (1)"
        check = true
      elsif finalTimer
        puts "Égalité !!!"
        check = true
      else
        puts "[ TIMER N° #{@timer} ] - Tour du joueur (2)"
        ask_player_turn(2)
        @timer += 1
        victory = board.check_victory?(player2.glyph)
        finalTimer = get_final_timer?
        if victory
          puts "Victoire du joueur (2)"
          check = true
        elsif finalTimer
          puts "Égalité !!!"
          check = true
        end
      end
    end
  end

  def get_final_timer?
    finalTime = false
    if @timer == @timerMax
      finalTime = true
    end
    finalTime
  end

  def ask_player_turn(numberPlayer)
    check = false
    while !check
      ask_coord(numberPlayer)
      if (numberPlayer == 1)
        if board.is_free_case?(player1.letter, player1.number)
          board.put_token_on_game_board(player1.glyph, player1.letter, player1.number)
          check = true
        else
          puts "Cette case est occupée !!!"
          puts "Rejouer votre coup !!!"
        end
      else
        if board.is_free_case?(player2.letter, player2.number)
          board.put_token_on_game_board(player2.glyph, player2.letter, player2.number)
          check = true
        else
          puts "Cette case est occupée !!!"
          puts "Rejouer votre coup !!!"
        end
      end
    end
    board.draw_game_board
  end

  def ask_coord(numberPlayer)
    ask_letter(numberPlayer)
    ask_number(numberPlayer)
  end

  def ask_letter(numberPlayer)
    check = false
    letter = ""
    while !check
      puts "Quelle lettre choisissez vous : A, B ou C ?"
      letter = gets.chomp
      if check_letter(letter)
        if numberPlayer == 1
          player1.letter = letter
        else
          player2.letter = letter
        end
        check = true
      end
    end
  end

  def check_letter(letter)
    check = false
    if !letter.empty?
      check = true
    end
    if check
      case letter.upcase
      when 'A'
        check = true
      when 'B'
        check = true
      when 'C'
        check = true
      else
        check = false
      end
    end
    return check
  end

  def ask_number(numberPlayer)
    check = false
    number = ""
    while !check
      puts "Quel chiffre choisissez vous : 1, 2 ou 3 ?"
      number = gets.chomp
      if check_number(number)
        if numberPlayer == 1
          player1.number = number
        else
          player2.number = number
        end
        check = true
      end
    end
  end

  def check_number(number)
    check = false
    if !number.empty?
      check = true
    end
    if check
      case number
      when '1'
        check = true
      when '2'
        check = true
      when '3'
        check = true
      else
        check = false
      end
    end
    return check
  end
end