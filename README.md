vim
===

Personal vim settings

**Note** Vim < 7.4 will not use ~/.vim/vimrc without the link ``ln -s
~/.vim/vimrc ~/.vimrc``
Key Bindings
============

###General Operation
``Ctrl+s`` ... save file

###Movement
``gg`` ... First line

``G`` ... Last Line

``Ctrl+d`` ... Page down

``Ctrl+u`` ... Page up

``#`` ... eol

``0`` ... beginning of line

###Tabs & Windows

``Ctrl+h`` ... move to the LEFT split window

``Ctrl+l`` ... move to the RIGHT split window

``Ctrl+ww`` ... move the NEXT split window



``Ctrl+j`` ... previous tab

``Ctrl+k`` ... next tab

###Coding
``Shift+k`` ... Docstring

``,+g`` ... go to

``Ctrl+g`` ... go to Definition

``Ctrl+o`` ... go back to last position

``Ctrl+i`` ... go forward in a position list

``,+r`` ... Redactor variable name

``,+d`` ... run ./debug.sh script

``,+b`` ... set breakepoint statement

``f`` ... fold

``F`` ... fold ALL

###Text Operations

``,c`` ... copy current word
``,v`` ... past copied word
``,s`` ... Spell Checker On/Off
``z=`` ... see spell checker suggestions
``zg`` ... add word to personal dictionary

###CTRLP Mode###
``Ctrl+T`` ... in new Tab
``Ctrl+v`` ... in vertical split
