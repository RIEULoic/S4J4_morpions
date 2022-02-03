require 'bundler'
Bundler.require

require_relative 'lib/game'



puts " ________________________________________________ "
puts "|                                                |"
puts "|  Bienvenue dans notre jeu MORPION in Ruby !    |"
puts "|                                                |"
puts "|________________________________________________|"
puts
puts
puts "                    A | B | C    "
puts
puts "                    _ | _ | _    "
puts "                   -----------   "
puts "                    _ | _ | _    "
puts "                   -----------   "
puts "                    _ | _ | _    "
puts 
puts



game = Game.new
game.new_game


