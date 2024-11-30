# 🎣 Fishing

A set of functions for the **F**riendly **I**nteractive **Sh**ell (fish). This is mainly made for a programmer in Haskell and Python, so it has some programs to make the Haskell stack and Python shell more convenient.

## List of functions

 - **`advent`**: shows the number of candles to lit for advent;
 - **`assets`**: get the directory where the fish assets are stored;
 - **`author`**: prefix the given file names with the name of the author;
 - **`backup`**: make readonly timestamped copies of the list of parameters;
 - **`biblespeak`**: speak the next verse of the *Bible*;
 - **`dated`**: add the timestamp as a prefix of the given files;
 - **`edithstack`**: will run the editor with the `.cabal` file(s) and the `.hs` files in the `src/` directory;
 - **`expand`**: a helper function to expand ranges and comma separated values to a (larger) list of parameters;
 - **`fill`**: fill the entire screen with a certain color;
 - **`frmclip`**: copy from the clipboard to the stdout;
 - **`from`**: initializes the python shell with `from …`, so `from datetime import date` for example can be written in the shell as first Python command;
 - **`fromtemplate`**: copies the file from the `templates/` subdirectory into the pwd, add it to git (if applicable), and starts editing;
 - **`fundo`**: desugar a `do` expression of Haskell;
 - **`fundjinn`**: generate a function implementation from a signature with *Djinn*;
 - **`funtype`**: determine the type of a Haskell expression;
 - **`getcolor`**: get the color for a given name;
 - **`gitc`**: make a git commit (short for `git commit -am`);
 - **`gitd`**: calculate the git difference and work with a pager to read the full response;
 - **`gitmaster`**: checkout the master branch (and stash work in progress if any);
 - **`gitmastertag`**: checkout the mater branch, pull from remote, tag the commit and push the tag to the repository;
 - **`gitp`**: pushes the changes to the remote repository (short for `git push`);
 - **`gitremote`**: add the remote as origin with the given `GIT_PREFIX` and the name of the directory as git project;
 - **`gits`**: prints the status of the current Git repository (short for `git status`);
 - **`gitu`**: pull the changes from the remote repository (short for `git pull`);
 - **`here_is_the_news`**: beeps a few times to mark a certain event;
 - **`hlint`**: run Haskell lint and use a pager for the results;
 - **`igrep`**: run grep in a case insensitive way;
 - **`import`**: initializes the python shell with `import …`, so `import datetime` for example can be written in the shell as first Python command;
 - **`keycolor`**: set the keyboard color to a specific color and intensity;
 - **`lessr`**: run `less` but allow to render ANSI terminal directives like color, etc.
 - **`numpy`**: start a Python shell with `numpy` imported;
 - **`pandas`**: start a Python shell with `numpy` and `pandas` imported;
 - **`pointfree`**: determine the pointfree version of a Haskell expression;
 - **`pomodoro`**: a tool to use the pomodoro technique for work and pause;
 - **`pwd`**: list the absolute path for the given files listed or the `pwd` if no arguments were provided;
 - **`python3`**: overrides normal Python prompt with an IPython shell without banner, no confirmations and matplotlib;
 - **`redo`**: redo a command until the exit code is 0;
 - **`rmake`**: walk up the filetree until it finds a Makefile;
 - **`rmemptydir`**: remove empty directories;
 - **`sensors`**: print the status of the sensors every second;
 - **`setvar`**: check if a variable with the name exists; if not, query for a value;
 - **`shlint`**: download the latest version of Haskell lint and run this version;
 - **`sleep_for`**: sleep a given number of hours;
 - **`stackb`**: build the haskell stack project with all warnings enabled;
 - **`stackbench`**: to run benchmarks on the haskell stack project, and write the results to a file named `benchmarks.html`;
 - **`stackd`**: build the documentation of the Haskell stack project;
 - **`stackg`**: run a ghci session for the given Haskell stack project;
 - **`stackr`**: run the program, this is an alias of `stack run`;
 - **`stackt`**: test the Haskell stack project;
 - **`stacktcov`**: test the Haskell project, and keep track of the coverage;
 - **`swapfiles`**: swap two or more files by renaming the second to the first, the third to the second, and the first to the last;
 - **`task`**: wrapper for `/usr/bin/task`, except that it reports tasks after the modification;
 - **`taskd`**: set the task with the given id as done;
 - **`teeth`**: help cleaning teeth;
 - **`unpart`**: look for parts with a corresponding file;
 - **`videos`**: see random videos;
 - **`vimc`**: create a directory if the directory does not yet exists before running `vim`;
 - **`vimp`**: use vim with different tabs, a shortcut for `vim -p`;
 - **`vimpsrc`**: open all the Haskell files in the `src` directory with `vim`;
 - **`waitfor`**: takes an argument and waits that amount of time with a countdown;
 - **`whatday`**: write the date in a color of the week; and
 - **`...`**: move to the root directory of the git repository, if that exists.

## Variables

 - **`COFFEE_MAX`**: end time of the day when coffee is no longer allowed, for example `1900`;
 - **`COFFEE_MIN`**: start time of the day when coffee is allowed in decimal notation, for example `0800`;
 - **`GIT_BRANCH`**: the default branch, used to automatically map the remote to the local default branch in `gitremote`;
 - **`GIT_REPO_PREFIX`**: the prefix of (most) git repositories, for example `github:hapytex`; and
 - **`USER_SLUG`**: the slug used to prepend to file names when adding an author to it, for example `Elon_Musk`.

## Installation

One can install this by downloading (or cloning) and put the files in the `~/.config/fish/functions/`
directory.

You can of course also clone this repository at that location and thus *pull* new changes directly to the configuration directory:

```bash
git clone github.com/hapytex/fishing.git ~/.config/fish/functions/
```
