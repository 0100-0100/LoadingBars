#!/usr/bin/python3
'''
Yellow Custom Load bar.

Last Updated By Diego Lopez Aug 8 2021
'''
from os import get_terminal_size as tty
from time import sleep

size = tty()  # ─ Get the size of the terminal.

cols = size.columns - 2  # ─ Substract 2 to prevent overflow.
print('\033[33m', end='')
print('┌' + '─' * cols + '┐')
print('│' + ' ' * cols + '│')
print('└' + '─' * cols + '┘', end='\r')
print('\033[1A\033[2C', end='')

cols = cols - 2

text = 'Yellow Bar'
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

    print('\033[33m', end='')
    if percentage >= 48:
        print('\033[97m\033[43m', end='')

    print('\033[{}C'.format(pos), end='')
    print('{}%  '.format(percentage), end='\r\033[1C')

    print('\033[{}C'.format(progress), end='')
    print('\033[43m \033[m', end='\r\033[1C')

    progress += 1

print('\n')
