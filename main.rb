require_relative 'player.rb'
config = IO.readlines('config.dat')
player = Player.new(config)

print player.welcome

player.play  
player.print_results
