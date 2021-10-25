MORSE_CODE_DICT = { 'A':'.-', 'B':'-...',
                    'C':'-.-.', 'D':'-..', 'E':'.',
                    'F':'..-.', 'G':'--.', 'H':'....',
                    'I':'..', 'J':'.---', 'K':'-.-',
                    'L':'.-..', 'M':'--', 'N':'-.',
                    'O':'---', 'P':'.--.', 'Q':'--.-',
                    'R':'.-.', 'S':'...', 'T':'-',
                    'U':'..-', 'V':'...-', 'W':'.--',
                    'X':'-..-', 'Y':'-.--', 'Z':'--..',
                    '1':'.----', '2':'..---', '3':'...--',
                    '4':'....-', '5':'.....', '6':'-....',
                    '7':'--...', '8':'---..', '9':'----.',
                    '0':'-----', ', ':'--..--', '.':'.-.-.-',
                    '?':'..--..', '/':'-..-.', '-':'-....-',
                    '(':'-.--.', ')':'-.--.-', 
                    'a':'.-', 'b':'-...',
                    'c':'-.-.', 'd':'-..', 'e':'.',
                    'f':'..-.', 'g':'--.', 'h':'....',
                    'i':'..', 'j':'.---', 'k':'-.-',
                    'l':'.-..', 'm':'--', 'n':'-.',
                    'o':'---', 'p':'.--.', 'q':'--.-',
                    'r':'.-.', 's':'...', 't':'-',
                    'u':'..-', 'v':'...-', 'w':'.--',
                    'x':'-..-', 'y':'-.--', 'z':'--..'}
 
# Function to encrypt the string
# according to the morse code chart
def encrypt(message):
    cipher = ''
    for letter in message:
        if letter != ' ':
 
            # Looks up the dictionary and adds the
            # correspponding morse code
            # along with a space to separate
            # morse codes for different characters
            cipher += MORSE_CODE_DICT[letter] + ' '
        else:
            # 1 space indicates different characters
            # and 2 indicates different words
            cipher += ' '
 
    return cipher

import os
import time

os.system('echo gpio | sudo tee /sys/class/leds/led0/trigger')
input_str = input('Enter a sentence: ')
morse_str = encrypt(input_str)
for letter in morse_str:
    if letter == '.':
        os.system('echo 1 | sudo tee /sys/class/leds/led0/brightness') # led on
        time.sleep(1)
        os.system('echo 0 | sudo tee /sys/class/leds/led0/brightness > /dev/null 2>&1') # led ooff
        time.sleep(1)
    elif letter == '_':    
        os.system('echo 1 | sudo tee /sys/class/leds/led0/brightness') # led on
        time.sleep(2)
        os.system('echo 0 | sudo tee /sys/class/leds/led0/brightness > /dev/null 2>&1') # led ooff
        time.sleep(1)
    else:
        time.sleep(2)

os.system('echo 1 | sudo tee /sys/class/leds/led0/brightness')


