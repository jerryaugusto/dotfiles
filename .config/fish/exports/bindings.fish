# Example: Use Ctrl+R to reverse search command history
bind \cr 'history-search-backward'

# Example: Use Ctrl+L to clear the terminal screen
bind \cl 'clear'

# Example: Use Alt+Left/Right to navigate word by word
bind \e\[1\;3C forward-word
bind \e\[1\;3D backward-word

# Example: Use Ctrl+U to delete the entire line
bind \cu 'commandline -C'

# Example: Use Ctrl+W to delete the previous word
bind \cw 'backward-delete-word'

# Example: Use Ctrl+F to move the cursor forward by one character
bind \cf 'commandline -f forward-char'

# Example: Use Ctrl+B to move the cursor backward by one character
bind \cb 'commandline -f backward-char'

