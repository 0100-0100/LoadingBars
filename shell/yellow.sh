#!/usr/bin/env bash
# 
# Default Custom Load bar.
# 
# Written By Diego Lopez May 24 2021
#
# Its default because it uses your current terminal's color.

# Star Drawing box. - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |

cols=$(tput cols) # ───────────── Get the width of the terminal.
cols=$(($cols - 3)) # ─────────── Substract 3 to prevent overflow.

echo -ne "\033[33m"
echo -n '┌' # ──────────────────┐ Print upper part of load bar box.
printf '─%.0s' $(seq 0 $cols) # ┤ String multiplication in bash.
echo '┐' # ─────────────────────┘

echo -n '│' # ──────────────────┐ 
printf ' %.0s' $(seq 0 $cols) # │ Print middle part uf load bar box.
echo '│' # ─────────────────────┘

echo -n '└' # ──────────────────┐ 
printf '─%.0s' $(seq 0 $cols) # │ Print bottom part uf load bar box.
echo -ne '┘\r' # ───────────────┘

echo -ne '\033[1A\033[2C' # ───── Set cursor to begining of loading bar.

cols=$(($cols - 1)) # ─────────── Substract one to account for padding.

# Set up Defult Loading Bar - - - - - - - - - - - - - - - - - - - - - - - - - -|

progress=0 # ──────────────────── Start progress variable.

text='Yellow Bar' # ────────── Inner text.

half=$(($(($cols - 1)) / 2))
#                │     │
#                └─────┴───────── Calculate half point.

len=$(($(($cols - ${#text})) / 2))
#               │            │
#               └────────────┴─── Calculate length of text.

echo -ne "\033[${len}C" # ─────── Move cursor to 'mid' point taking
#                                        length into account.

echo -ne "$text\r" # ───────────┐ Print text.
echo -ne '\033[2C' #            │ Move to beggining of bar.
sleep 2 # ──────────────────────┘ Wait 2 seconds.

printf ' %.0s' $(seq 0 $cols) # ┐
echo -ne '\r' #                 │ Clean text.
echo -ne '\033[2C' # ───────────┘

# Start main loading loop - - - - - - - - - - - - - - - - - - - - - - - - - - |
while [ $progress -le $(($cols)) ]; do

    sleep 0.004 # ─────────────── Sleep for 4 ms
    
    percentage=$(($(($progress * 100)) / $cols))
    #                          │       │       
    #                          └ Calculate percentage.
    
    len=$(($(($cols - ${#percentage})) / 2))
    #               │                  │
    #               └ Calculate length ┘
    #                 of percetange text.

    if (($percentage >= 48)); then #──┐
        echo -ne "\033[97m\033[43m" #│ Invert text if percentage > 48
    fi # ─────────────────────────────┘ 

    echo -ne "\033[${len}C" # ────────────┐ Move cursor right len distance.
    echo -ne "${percentage}% \r" #│ Print percentage.
    echo -ne '\033[m\033[1C' # ───────────┘ Move one right.

    echo -ne "\033[${progress}C" # ─┐ Move cursor right progress distance.
    echo -ne "\033[33m█\r" #        │ Print bar.
    echo -ne '\033[1C' # ───────────┘ Move one right.

    progress=$[ $progress + 1 ] # ─── Progress ++
done

echo ""
echo ""
