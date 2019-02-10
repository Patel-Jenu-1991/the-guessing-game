all: README.md

time_date=$(date)

README.md:
	touch README.md
	echo >> README.md
	echo "# The Guessing Game" >> README.md
	echo "---" >> README.md
	echo >> README.md
	echo "## Date and Time of make: " >> README.md
	echo >> README.md
	date >> README.md
	echo >> README.md
	echo "### Number of lines in guessinggame.sh:" >> README.md
	echo >> README.md
	wc -l guessinggame.sh | egrep -o "[0-9]+" >> README.md	
