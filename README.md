# LoadingBars

### This is my own implementation of a more visually appealing loading bar for use in CLI applications and programs.

### Please Let me know about any issues you find using these.

![gif animation of bars loading](LoadingBars.gif)

As practice, I'm implementing the same loading bars in the basic 8 colors with
the use of ANSI escape sequences all of the languages I know.
Due to the use of ANSI escapes this code would not run as intended on PowerShell
or CMD in a purely WindowsOS, but it will run in any Windows using WSL and any
Unix-like OS like Linux or AppleOS with bash or zsh.

Currently implemented languages:
- Bash Script
- Python

Inside the folder for the given language you can find the simplest implementation in th default
version file.

		./default.sh
		./default.py
	 
		# To print a sample loading bar using the default
		  foreground color of your terminal.

This is intended to be used as a guide or template on how to implement a loading bar with your
application running on a console.
