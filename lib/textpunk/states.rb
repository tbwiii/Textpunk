class States
	def initialize()
		@bools = {
			'humming' => true, 
			'barefoot' => true, 
			'closet_light' => false
		}
	end

	def closet_desc()
		if @bools['closet_light'] 
			puts "It's a utility closet. Mostly tools. There is only one door."
		
		else
			puts "It's dark, but you can feel a door in front of you."	
		
		end
	end

	def light_switch()
		@bools['closet_light'] = !@bools['closet_light']
	end

	def hear_hum()
		if @bools['humming']
			puts "You hear a faint humming...
			"
		end
		# the game tells the player they hear humming 			
		# until they look out a window and see they're on an airship
	end


	def no_shoes()
		if @bools['barefoot']
			puts "The soft carpet feels nice.\nOh crap, you're bare-footed. You'll have to fix that.
			"
			#this evaluates true until the player finds and takes the boots
		end
	end
end