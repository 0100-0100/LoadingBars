# LoadingBars

### This is my own implementation of a more visually appealing loading bar for use in CLI applications and programs.

![gif animation of bars loading](LoadingBars.gif)

As a practice for me, I'm implementing the same loading bars in the basic 8 colors with
the use of ANSI escape sequences in as many languages as I can, due to the ANSI escapes
this code would not run as intended on PowerShell or CMD in a WindowsOS, but it will run
in any Unix-like OS, on Windows using WSL and Apple OS with bash or zsh.

Currently implemented languages:
- Bash Script
- Python


Inside the folder for the given language you can find the simplest implementation in th default
version file.

		./default.sh
		./default.py
	 
		# To print a sample loading bar using the default color of your terminal.

This is intended to be used as a guide or template on how to implement a loading bar with your
application running on a console.
