vimrc can use any command you type after a colon.

so ~/.vimrc # this will reload vimrc after changes 

map Q qq
    - defines a key maping from Q to qq
   
I should map ss to save and zz to quit 
CTRL+ee to scroll 10 lines at once 

Recording in vim
    - enter recording mode by pressing q in visual
    - exit by pressing q again in visual 
    - replay the actions you took by typing @<letter> that you wrote the 
        commands to
    - Q and qq both enter recording mode somehow. not sure how all this 
        works yet 


search highlighting 
    - type :noh to clear search highlighting 
    - map to space 
    - :noh just clears highlighting but it will be available for the next
        search
    - :map <Space> :noh 

package managers
    - vundle
    - pathogen 
    - how to manage this? what is the difference 


"e" moves to the end of the word
"b" is beginning
ge 
w

% moves to matching parens

CTRL+U lets you scroll half a screen of text
CTRL+D lets you scroll the other direction
zz moves the cursor to the center of the screen 

remember control-e and control-y allow you to scroll without moving 
the cursor

"u" and control-R allow you to undo and redo

windows
    - split
    - only
    - new 
    - vsplit
    - vertical new
    - wall
        * write all files

tabs (UI feature) 
    - tabs give you a new collection of windows. 
        * same buffers, different layout 
        * just a new useful layout 
    - most commands only work in the current tab 
    - tabnew
    - tabedit
    - tabn * go to next tab layout 
    - tabp * go to prev tab layout
    - * I should use control-shift-p and n to do this
    :+tabmove
    :-tabmove * move tab right and left respectively 

Map modes
    - how do they work? 
        * probably one of the worst explained topics in the entire
        guide 
    - there are mode letters
        n, v, o, x, s, i, c, l 
        there are a few modes also 

    n :normal only
    v :visual and select
    o :operator pending
    x :visual only
    s :select only
    i :insert 
    c :command-line
    l :insert, command-line, regex


    remap
        - option that makes mappings work recursively 
    :map 
        - recursive
    :noremap
        - non-recursive
    :unmap
        - get default behavior back
    :mapclear
        - clears all mappings for a mode  



Modes
    Normal (apparently this is the same as command mode)
    Visual
    Select
    Insert
        # additional modes
        Insert Normal
        Insert Visual
        Insert Select
    Command
    Ex

    # additional modes
    Operator-pending
        # while you are in the middle of an account
    Replace
    Visual Replace
    



recursive vs non-recursive mapping
- recursive causes the map to expand from K to H, then H to G
- non-recursive mapping does not allow the map to recursively expand
nmap K H 
noremap H G
noremap G gg


Spell Checking
    * 
    * autocommand, when you enter insert or something set spell, when you exit
    turn it off
    * set spell
    * set nospell
    * ]s and [s will move between mispelled words
    * z= will suggest a list of alternatives 
    * zg * add a word to your spellfile
    * zw * mark the word off as bad



autocmd InsertEnter * setlocal spell
autocmd InsertLeave * setlocal nospell


Suspend and resume
    * CTRL-Z {commands} fg 
    * this will take you to shell and then restart
    * :shell will open a new shell but dont do this
    * 

modelines
    * a modeline tells vim a bunch of options
    * :set modelines=10 in order to tell vim how many lines to read


Inserting Quickly
    * when you typed the wrong word, use CTRL+W to delete it
    * CTRL+U will delete the line but only before the cursor

    * showmatch - show the matching parens
    
Autocomplete
    * press CTRL+P in insert mode and enter auto completion mode 
    * CTRL+N does forward search 

    # prefix these with CTRL+X
    * CTRL+D - macro definitions
    * CTRL+L - whole lines
    * CTRL+K/T - dictionary or thesaurus 
    * CTRL+F - file names
    * 

Registers
    * type :reg to see all registers
    * registers let you store text
    * single double quote allows you to access the register
    * @ allows you to execute the recorded command
    * "* or "+ contents of the system clipboard
    * "/ last search command
    * ": last command

Special characters
    * CTRL+V - the next character will be literal 
    * CTRL+K - diagraphs, where two characters represent one 


Editing Formatted Text
    * breaking lines
    * aligning text
    * indents and tabs
    * dealing with long lines
    * editing tables

set textwidth option
    * vim will autowrap text and insert newlines for you 
    * aligning text
        :{range}center [width] 
    * the range is the range of lines to apply the formatting to
    
    * there is no built in way of justifying text

Indents and tabs
    * :set autoindent 
    * set shiftwidth  # >> will insert x spaces
    * to get tab to give you the same number of spaces
    set softtabstop=4
    * if you want spaces and no tabs, set "expandtab"
    * "tabstop" will make things look wrong if it is set differently
        in another editor 
    * :retab 8 will change tabstop to 8, also changes whitespace into
    tabs for this.

    * tabstop = width in columns of a tab character
    * expandtab/noexpandtab = convert tab to spaces
    * softtabstop
    * shiftwidth 

    * > in visual mode inserts a tab
    * >> in normal mode inserts a tab


Batch mode
    * you can script vim and have it do stuff from a shell script
    * batch processing or whatever is good for doing something to
        a lot of files



Search Commands and Patterns
    * Ignoring case
        ignorecase
        noignorecase
        ignorecase smartcase # matches case if one caps present
    * \= makes the previous character optional 
    * \| is an alternative /foo\|bar matches foo or bar
    * * matches the item before it any number of times
        \(foo\)* matches foo any number of times
    * standard regex character ranges


Folding Text
    * separate text into sections, display one section as a line
    * zf - "ap" is what we use to select the paragraph, zf creates fold 
    * zo - open the fold
    * zc - close the fold 
    * zd - delete a fold
    * zD - delete all folds at cursor line 

    * zR - open all, nested
    * zM - close all folds nested 

    You can yank and delete folds like they were one line of text
    
    :set foldcolumn=4 # sets a column on the left to show folds 
  
    Storing folds
        * :mkview command 
        * this stores all settings and whatever that go along with 
        the file 
        * :loadview - you can store multiple for each file 

    Fold by indent
        * :set foldmethod=indent
    Fold by marker
        * :set foldmethod=marker
        * look in "advanced editing" portion of help text
    Fold by syntax
        * see in the other reference manual
        * probably the best choice


Vim + Python 
    * compile vim with the +Python3 feature
    :python print("hello vim")

    * :py b = vim.buffers[n]
    * python import vim

Marks
    * [ start of last change
    * ] end of last change
    * ' cursor position before jump '
    * " cursor position hwen last editing the file "

    not immediately clear how to set and unset marks
    then jump to them 
    
    Backtick is jump to where you were before
    
    "ma" marks "a" under the cursor
    `a jumps to the mark
    'a apparently does the same thing    '

    :delmarks A-Z0-9 deletes marks



Syntax
    * how do you do this for only one file




AutoCommands
    * commands that are automatically run in response to an event
    * very powerful way to get things done  
    :autocmd BufWritePre * call DateInsert()
    
    function DateInsert()
        $delete
        read !date
    endfunction


Showing invisible characters
    * set list
    * set nolist
    * set list! # toggles the command
    * customize the symbols using listchars 

    * these are the sytnax things for invisible characters colors 
    NonText
    SpecialKey

