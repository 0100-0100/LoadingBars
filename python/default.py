#!/usr/bin/python3
"""
Default Custom Load bar.

Written By Diego Lopez May 29 2021

Its default because it uses your current terminal's color.
"""
from os import get_terminal_size as tty
from time import sleep

size = tty()  # ─ Get the size of the terminal.

cols = size.columns - 2  # ─ Substract 3 to prevent overflow.

print('┌' + '─' * cols + '┐')
print('│' + ' ' * cols + '│')
print('└' + '─' * cols + '┘', end='\r')
print('\033[1A\033[2C', end='')

cols = cols - 2

text = 'Default Bar'
pos = (cols - len(text)) // 2

print('\033[{}C'.format(pos), end='')
print(text, end='\r')
print('\033[2C', end='')
sleep(2)

print(' ' * cols, end='\r')
print('\033[2C', end='')

progress = 0
while progress <= cols:

    sleep(0.004)
    percentage = (progress * 100) // cols
    pos = (cols - len(str(percentage))) // 2

    if percentage >= 48:
        print("\033[7m", end='')

    print("\033[{}C".format(pos), end='')
    print("{}%  ".format(percentage), end="\r")
    print('\033[m\033[1C', end='')

    print("\033[{}C".format(progress), end='')
    print("\033[7m \033[m", end='\r')
    print('\033[1C', end='')

    progress += 1

print('\n')
