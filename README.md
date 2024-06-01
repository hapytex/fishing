# Fishing

A set of functions for the Friendly Interactive SHell (FISH).

## List of functions

 - **`edithaskell`**: will run the editor with the `.cabal` file(s) and the `.hs` files in the `src/` directory;
 - **`frmclip`**: copy from the clipboard to the stdout;
 - **`fundo`**: desugar a `do` expression of Haskell;
 - **`fundjinn`**: generate a function implementation from a signature with *Djinn*;
 - **`funtype`**: determine the type of a Haskell expression;
 - **`gitc`**: make a git commit (short for `git commit -am`);
 - **`gitd`**: calculate the git difference and work with a pager to read the full response;
 - **`gitmaster`**: checkout the master branch (and stash work in progress if any);
 - **`gitmastertag`**: checkout the mater branch, pull from remote, tag the commit and push the tag to the repository;
 - **`gitp`**: pushes the changes to the remote repository (short for `git push`);
 - **`gits`**: prints the status of the current Git repository (short for `git status`);
 - **`gitu`**: pull the changes from the remote repository (short for `git pull`);
 - **`here_is_the_news`**: beeps a few times to mark a certain event;
 - **`hlint`**: run Haskell lint and use a pager for the results;
 - **`igrep`**: run grep in a case insensitive way;
 - **`lessr`**: run `less` but allow to render ANSI terminal directives like color, etc.
 - **`numpy`**: start a Python shell with `numpy` imported;
 - **`pandas`**: start a Python shell with `numpy` and `pandas` imported;
 - **`pointfree`**: determine the pointfree version of a Haskell expression;
 - **`python3`**: overrides normal Python prompt with an IPython shell without banner, no confirmations and matplotlib;
 - **`redo`**: redo a command until the exit code is 0;
 - **`rmemptydir`**: remove empty directories;
 - **`shlint`**: download the latest version of Haskell lint and run this version;
 - **`stackb`**: build the haskell stack project with all warnings enabled;
 - **`stackbench`**: to run benchmarks on the haskell stack project, and write the results to a file named `benchmarks.html`;
 - **`stackd`**: build the documentation of the Haskell stack project;
 - **`stackg`**: run a ghci session for the given Haskell stack project;
 - **`stackr`**: run the program, this is an alias of `stack run`;
 - **`stackt`**: test the Haskell stack project;
 - **`stacktcov`**: test the Haskell project, and keep track of the coverage;
 - **`vimc`**: create a directory if the directory does not yet exists before running `vim`;
 - **`vimp`**: use vim with different tabs, a shortcut for `vim -p`; and
 - **`vimpsrc`**: open all the Haskell files in the `src` directory with `vim`.

## Installation

One can install this by downloading (or cloning) and put the files in the `~/.config/fish/functions/`
directory. You can of course also clone this repository at that location and thus
*pull* new changes directly to the configuration directory.
