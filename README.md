# Fishing

A set of functions for the Friendly Interactive SHell (FISH).

## List of functions

 - **`edithaskell`**: will run the editor with the `.cabal` file(s) and the `.hs` files in the `src/` directory;
 - **`frmclip`**: copy from the clipboard to the stdout;
 - **`gitc`**: make a git commit (short for `git commit -am`);
 - **`gitmaster`**: checkout the master branch (and stash work in progress if any);
 - **`gitp`**: pushes the changes to the remote repository (short for `git push`);
 - **`gits`**: prints the status of the current Git repository (short for `git status`);
 - **`gettmaster`**: checkout the mater branch, pull from remote, tag the commit and push the tag to the repository;
 - **`gitu`**: pull the changes from the remote repository (short for `git pull`);
 - **`hlint`**: run Haskell lint and use a pager for the results;
 - **`igrep`**: run grep in a case insensitive way;
 - **`lessr`**: run `less` but allow to render ANSI terminal directives like color, etc.
 - **`numpy`**: start a Python shell with `numpy` imported;
 - **`pandas`**: start a Python shell with `numpy` and `pandas` imported;
 - **`rmemptydir`**: remove empty directories;
 - **`shlint`**: download the latest version of Haskell lint and run this version;
 - **`stackb`**: build the haskell stack project with all warnings enabled;
 - **`stackd`**: build the documentation of the Haskell stack project;
 - **`stackg`**: run a ghci session for the given Haskell stack project;
 - **`stackt`**: test the Haskell stack project; and
 - **`vimp`**: use vim with different tabs, a shortcut for `vim -p`.

## Installation

One can install this by downloading (or cloning) and put the files in the `~/.config/fish/functions/`
directory. You can of course also clone this repository at that location and thus
*pull* new changes directly to the configuration directory.