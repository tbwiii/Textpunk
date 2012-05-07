class Airship

	

	def initialize(states)
		@states = states
	end

	def prompt
		print "> "
		return gets.chomp.downcase
	end

	def non_action(action) 
		
		quips = [
				"You mumble \"#{action}\" to yourself.\nWhich is fine...really...everyone says\n\"#{action}\" to themselves all the time.",
				"Sure, you could try \"#{action}\". But maybe some other time.",
				"You should try something smarter...",
				"Don't you worry about \"#{action}\". Let me worry about \"#{action}\""
			]
	
		if action.include? 'exit' or action.include? 'quit' or action.include? 'die'
			puts "You just...die..."
			Process.exit(1)
		else
			puts quips[rand(quips.length())]
		end

	end

	def title()
		puts "

	       _..--=--..._
	    .-'            '-.  .-.
	   /.'              '.\\/  /
	  |=-    TEXTPUNK    -=| (
	   \\'.              .'/\\  \\
	    '-.,_____ _____.-'  '-'
	          [_____]=8

	 Type 'Begin' to get started
	"

	  return :intro
	end

	def intro()

		action = prompt()

		if action == 'begin'

			puts "You've been knocked out maybe?\nWho knows...\nYou stand up."

			return :closet

		else
			puts "Type 'Begin' to get started"
			return :intro
		end
			
	end #intro end

	def closet()
		@states.closet_desc()

		action = prompt.downcase

		if action.include? "open" or action.include? "door"
			puts "The door is unlocked so you step through"
			return :hall_back
		elsif action.include? "light"
			@states.light_switch()
			return :closet
		else
			non_action(action)
			return :closet
		end
	end

	def hall_back()
		puts "You're in what looks to be the back of the main hallway.\nIt's very nice with its wooden walls and red carpeting.
		" 

		@states.no_shoes()

		@states.hear_hum()
		
		puts message = "The hallway is really long and it looks like there's a door at the end,\nand a few in between. But you'll have to walk to get to any of them.\nOf course you could just go back to sleep in the closet.
		"

		action = prompt.downcase
		if action.include? "walk"
			return :hall_front

		elsif action.include? "closet" or action.include? "back"
			return :closet
		else
			non_action(action)
			return :hall_back

		end
		
	end

	def hall_front()
		puts "You're down the hallway.
		"

		@states.no_shoes

		@states.hear_hum

		puts "There are four doors. They all have nice signs\n\"Crew Only\", \"Ballroom\", \"Guest Quarters\", and \"Leisure\".\nThere's also the closet door at the back of the hall.\nYou'll have to walk to get there.
		"

		action = prompt()
		if action.include? "walk"
			return :hall_back
		elsif action.include? "crew"
			puts "You walk into the room labeled \"Crew Only\"."
			return :crew
		elsif action.include? "leisure"
			return :leisure
		elsif action.include? "guest" or action.include? "quarters"
			return :guest_hall
		elsif action.include? "ballroom"
			return :ballroom
		else
			non_action(action)
			return :hall_front
		end
	end #end hall_front method

	def crew
		puts "The people who are in there are busy and moving around a lot. \nBest not be noticed.
		"
		@states.hear_hum

		puts "There are three doors on the wall that the hallway door is on. \nOne all the way to the right, one all the way to the left, and \nthe one in the middle that leads back to the hallway. On the \nopposite wall, there is only one door. But it looks like a big important door...
		"

		action = prompt()

		if action.include? 'middle' or action.include? 'center' or action.include? 'hall'
			return :hall_front
		elsif action.include? 'big' or action.include? 'important' or action.include? 'oppisite'
			return :bridge
		else
			non_action(action)
			return :crew
		end

	end
end #end Airship Class