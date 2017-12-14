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
']#Our handy snowman array ... that is slowly melting (oh no!)
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
		system("clear")#This is assuming a unix like system replace with cls if on windows!
		puts SNOWMAN[i]#Displaying the slowly melting and existential snowman
		puts word.tr(current,'_')#so we are replacing any characters we haven't guessed and replacing it with underscores
		print "Guess #{i+1}: "
		guess=gets
		guess=guess[0]#We are only going to let them guess one character at a time ...
		if current.include? guess.downcase#If we guessed a character we havent guessed yet
			current.delete!(guess)#Then remove the character from the yet to be guessed pool
			if(current=="")#Check if we are done
				return true
			else
				redo#if we arn't then redo this itteration of the loop
			end
		end
	}
	return false
end
word=getWord #Word we are guessing
#puts word #uncomment this line if you want to cheat!
if snowmanEngine(word)
	puts "Congrats! the correct answer was #{word}"
else
	system("clear")
	puts SNOWMAN[5]#The last vestiges of our melted snowman
	puts "awww ... you were so close! the correct answer was #{word}"
end
