word="boop" #Word we are guessing
current=word#Our current working word
(0..4).each{|i|
	puts current
	print "Guess #{i+1}: "
	guess=gets
	guess=guess[0]
	if current.include? guess.downcase
		current.delete!(guess)
		if(current=="")
			break
		else
			redo
		end
	end
}
