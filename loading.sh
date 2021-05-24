#!/usr/bin/env bash

# Print box for loading bar.
# Get the width of the terminal.
cols=$(tput cols)
cols=$(($cols - 4))

# Print upper part uf load bar box.
echo -n '┌'
printf '─%.0s' $(seq 0 $cols)
echo '┐'

# Print middle part uf load bar box.
echo -n '│'
printf ' %.0s' $(seq 0 $cols)
echo '│'

# Print bottom part uf load bar box.
echo -n '└'
printf '─%.0s' $(seq 0 $cols)
echo '┘'

# Move cursor one line up.
echo -ne '\033[2A'

# Draw again the leftside border.
echo -n '│ '

echo -en '\033[s' # Save cursor's position to start of load bar.


# # Start of 8 colors bar - - - - - - - - - - - - - - - - - - - - - - - - - - - |
# #
# #
# echo -ne '\033[2B'
# echo -ne "8 Colors loading bar"
# # Loop through basic 8 colors
# for ((color = 30; color < 38; color++)); do
#     echo -en '\033[u' # Reset cursor.
#     # Printing bar loop.
#     for ((i = 0; i < $(($cols - 1)); i++)); do
#         echo -ne "\033[${color}m▋\033[m"
#         sleep 0.001 # 1 milliseconds.
#     done
#     sleep 1
# done
# echo -en '\033[u' # Reset cursor.


# # Start of 256 colors bar.
# #
# # Blue scale. - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - |
# echo -ne '\033[2B' # Move cursor 2 lines down.
# echo -ne "256 Colors loading bar - \033[38;5;21mblue  "
# echo -en '\033[u' # Reset cursor.
# # Main load loop
# for ((i = 16; i <= 20; i++)); do
#     echo -en "\033[38;5;${i}m"
#     printf '▋%.0s' $(seq 1 $(($(($(tput cols) - 2)) / 6)))
#     echo -en "\033[0m"
#     sleep 0.5 # 500 milliseconds.
# done
# # Is much better to do last step here to reduce column length
# # in the 1st parameter for seq below $(seq <last bar len> ...)
# #
# # Last step color bar.
# echo -en "\033[38;5;${i}m"
# printf '▋%.0s' $(seq 3 $(($(($(tput cols) - 2)) / 6)))
# echo -en "\033[0m"
# echo -en '\033[u' # Reset cursor.


# # Green scale. - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -|
# echo -ne '\033[2B' # Move cursor 2 lines down.
# echo -ne "256 Colors loading bar - \033[38;5;46mgreen   "
# echo -en '\033[u' # Reset cursor.

# # Main load loop
# for ((i = 16; i <= 40; i += 6)) do
#     echo -en "\033[38;5;${i}m"
#     printf '▋%.0s' $(seq 1 $(($(($(tput cols) - 2)) / 6)))
#     echo -en "\033[0m"
#     sleep 0.5 # 500 milliseconds.
# done
# # Last step color bar.
# echo -en "\033[38;5;${i}m"
# printf '▋%.0s' $(seq 3 $(($(($(tput cols) - 2)) / 6)))
# echo -en "\033[0m"
# echo -en '\033[u' # Reset cursor.


# # Red scale. - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -|
# echo -ne '\033[2B' # Move cursor 2 lines down.
# echo -ne "256 Colors loading bar - \033[38;5;196mred     "
# echo -en '\033[u' # Reset cursor.

# # Main load loop
# for ((i = 16; i <= 160; i += 36)) do
#     echo -en "\033[38;5;${i}m"
#     printf '▋%.0s' $(seq 1 $(($(($(tput cols) - 2)) / 6)))
#     echo -en "\033[0m"
#     sleep 0.5 # 500 milliseconds.
# done
# # Last step color bar.
# echo -en "\033[38;5;${i}m"
# printf '▋%.0s' $(seq 3 $(($(($(tput cols) - 2)) / 6)))
# echo -en "\033[0m"
# echo -en '\033[u' # Reset cursor.


# # Cyan scale. - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -|
# echo -ne '\033[2B' # Move cursor 2 lines down.
# echo -ne "256 Colors loading bar - \033[38;5;51mcyan   "
# echo -en '\033[u' # Reset cursor.

# # Main load loop
# for ((i = 16; i <= 44; i += 7)) do
#     echo -en "\033[38;5;${i}m"
#     printf '▋%.0s' $(seq 1 $(($(($(tput cols) - 2)) / 6)))
#     echo -en "\033[0m"
#     sleep 0.5 # 500 milliseconds.
# done
# # Last step color bar.
# echo -en "\033[38;5;${i}m"
# printf '▋%.0s' $(seq 3 $(($(($(tput cols) - 2)) / 6)))
# echo -en "\033[0m"
# echo -en '\033[u' # Reset cursor.


# # Yellow scale. - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -|
# echo -ne '\033[2B' # Move cursor 2 lines down.
# echo -ne "256 Colors loading bar - \033[38;5;226myellow   "
# echo -en '\033[u' # Reset cursor.

# # Main load loop
# for ((i = 16; i <= 184; i += 42)) do
#     echo -en "\033[38;5;${i}m"
#     printf '▋%.0s' $(seq 1 $(($(($(tput cols) - 2)) / 6)))
#     echo -en "\033[0m"
#     sleep 0.5 # 500 milliseconds.
# done
# # Last step color bar.
# echo -en "\033[38;5;${i}m"
# printf '▋%.0s' $(seq 3 $(($(($(tput cols) - 2)) / 6)))
# echo -en "\033[0m"
# echo -en '\033[u' # Reset cursor.

# Start of RGB colors bar.
#
step=$((256 / $(($cols - 1)))) # Determine step band size for rgb colors.
# for ((i = 0; i < $(($cols - 1)); i += $step)); do
for ((i = 0; i < 256; i += $step)); do
    echo -en "\033[38;2;${i};${i};${i}m"
    # printf '▋%.0s' $(seq 0 $step)
    echo -ne '▋'
    echo -en "\033[0m"
done

echo -e "\n\n"
