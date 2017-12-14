SNOWMAN=[
'        ________
        |      |
        |      |
     <============>
       /       \
      |   * *   |
      |    =>   |
       \  `---` /
\|/     -------     \|/
 \    /    *    \    /
  \===     *     ===/
     |     *     |
      \         /
       ---------
      /    *    \
     /     *     \
    |      *      |
    |             |
     \           /
      \_________/
',
'        ________
        |      |
        |      |
     <============>
       /       \
      |   * *   |
      |    =>   |
       \   ---  /
\|/     -------     \|/
 \    /    *    \    /
  \===     *     ===/
     |     *     |
      \         /
       ---------
',
'        ________
        |      |
        |      |
     <============>
       /  \ /  \
      |   * *   |
      |    =>   |
       \  (===) /
\|/     -------
 \    /    *    \
  \===     *     |
     |     *     |
      \         /
       ---------
',
'        ________
        |      |
        |      |
     <============>
       /  \ /  \
      |   * *   |
      |    =>   |
       \  (===) /
        -------
      /    *    \
     |     *     |
     |     *     |
      \         /
       ---------
',
'        ________
        |      |
        |      |
     <============>
       /       \
      |   - -   |
      |    =>   |
       \   ~~~  /
        -------
',
'        ________
        |      |
        |      |
     <============>
']

def getWord()
	File.open("./corncob_lowercase.txt"){|f|
		line=nil
		rand(1..58110).times{line=f.gets}
		puts line
		return line.chomp()
	}
end
def snowmanEngine(word)
	current=word.dup#Our current working word
	(0..4).each{|i|
		system("clear")
		puts SNOWMAN[i]
		puts word.tr(current,'_')
		print "Guess #{i+1}: "
		guess=gets
		guess=guess[0]
		if current.include? guess.downcase
			current.delete!(guess)
			if(current=="")
				return true
			else
				redo
			end
		end
	}
	return false
end
word=getWord #Word we are guessing
puts word
if snowmanEngine(word)
	puts "Congrats! the correct answer was #{word}"
else
	system("clear")
	puts SNOWMAN[5]
	puts "awww ... you were so close! the correct answer was #{word}"
end
