load 'textpunk/map.rb'
load 'textpunk/states.rb'
load 'textpunk/engine.rb'

states = States.new
map = Airship.new(states)
punk = Engine.new(map,:title)
punk.play()