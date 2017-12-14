def getWord()
	File.open("./corncob_lowercase.txt"){|f|
		line=nil
		rand(1..58110).times{line=f.gets}
		puts line
		return line.chomp()
	}
end
word=getWord #Word we are guessing
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
