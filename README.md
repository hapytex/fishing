# 🎣 Fishing

A set of functions for the **F**riendly **I**nteractive **Sh**ell (fish). This is mainly made for a programmer in Haskell and Python, so it has some programs to make the Haskell stack and Python shell more convenient.

## List of functions

 - **`advent`**: shows the number of candles to lit for advent;
 - **`airplane`**: turn on airplane mode;
 - **`alarm`**: show distress;
 - **`assets`**: get the directory where the fish assets are stored;
 - **`author`**: prefix the given file names with the name of the author;
 - **`backup`**: make readonly timestamped copies of the list of parameters;
 - **`battery`**: print the percentage of the battery;
 - **`biblespeak`**: speak the next verse of the *Bible*;
 - **`blooddonation`**: register a blood donation together with blood metrics;
 - **`bloodpressure`**: register a blood pressure measurement;
 - **`coffee`**: wait until the coffee machine has finished two cups of coffee;
 - **`dated`**: add the timestamp as a prefix of the given files;
 - **`dishwasher`**: wait until the dishwasher has finished;
 - **`edithstack`**: will run the editor with the `.cabal` file(s) and the `.hs` files in the `src/` directory;
 - **`eggs`**: wait until the eggs are fully cooked in the water boiler;
 - **`expand`**: a helper function to expand ranges and comma separated values to a (larger) list of parameters;
 - **`fill`**: fill the entire screen with a certain color;
 - **`fish_home`**: get the directory where the fish functions are stored;
 - **`frmclip`**: copy from the clipboard to the stdout;
 - **`from`**: initializes the python shell with `from …`, so `from datetime import date` for example can be written in the shell as first Python command;
 - **`fromtemplate`**: copies the file from the `templates/` subdirectory into the pwd, add it to git (if applicable), and starts editing;
 - **`fundo`**: desugar a `do` expression of Haskell;
 - **`fundjinn`**: generate a function implementation from a signature with *Djinn*;
 - **`funtype`**: determine the type of a Haskell expression;
 - **`getcolor`**: get the color for a given name;
 - **`gh_status`**: set the GitHub status;
 - **`gitc`**: make a git commit (short for `git commit -am`);
 - **`gitd`**: calculate the git difference and work with a pager to read the full response;
 - **`gitmaster`**: checkout the master branch (and stash work in progress if any);
 - **`gitmastertag`**: checkout the mater branch, pull from remote, tag the commit and push the tag to the repository;
 - **`gitp`**: pushes the changes to the remote repository (short for `git push`);
 - **`gitremote`**: add the remote as origin with the given `GIT_PREFIX` and the name of the directory as git project;
 - **`gits`**: prints the status of the current Git repository (short for `git status`);
 - **`gitu`**: pull the changes from the remote repository (short for `git pull`);
 - **`groq`**: ask *Groq* something;
 - **`groqquick`**: ask Groq something and read the result with `quickread`;
 - **`here_is_the_news`**: beeps a few times to mark a certain event;
 - **`hlint`**: run Haskell lint and use a pager for the results;
 - **`homebattery`**: determine how long it will take to load the battery full;
 - **`household`**: wait until a household device has finished with info;
 - **`igrep`**: run grep in a case insensitive way;
 - **`import`**: initializes the python shell with `import …`, so `import datetime` for example can be written in the shell as first Python command;
 - **`keycolor`**: set the keyboard color to a specific color and intensity;
 - **`lessr`**: run `less` but allow to render ANSI terminal directives like color, etc.
 - **`list`**: add or inspect a (shopping) list;
 - **`makealias`**: make an alias file;
 - **`measure`**: add a given measurement at a given time;
 - **`natrix`**: the Python interpreter of the fish environment;
 - **`natrix-env`**: run a Python program in the natrix environment;
 - **`numpy`**: start a Python shell with `numpy` imported;
 - **`pandas`**: start a Python shell with `numpy` and `pandas` imported;
 - **`pointfree`**: determine the pointfree version of a Haskell expression;
 - **`pomodoro`**: a tool to use the pomodoro technique for work and pause;
 - **`presleep`**: first gradually make a person sleepy before the `sleep_for`;
 - **`proofread`**: proofread a text from the stdin with *Groq* to find spelling and grammatical errors;
 - **`proofreadmd`**: proofread Markdown files with Groq to find spelling and grammatical errors;
 - **`pwd`**: list the absolute path for the given files listed or the `pwd` if no arguments were provided;
 - **`python3`**: overrides normal Python prompt with an IPython shell without banner, no confirmations and matplotlib;
 - **`quickread`**: 𝗯𝗼𝗹face the 𝗳𝗶rst 𝗹𝗲𝘁ters of 𝗲ach 𝘄ord, 𝘀𝗽𝗲eding up 𝗿𝗲𝗮ding;
 - **`redo`**: redo a command until the exit code is 0;
 - **`remake`**: a loop to remake certain products with a Makefile;
 - **`rmake`**: walk up the filetree until it finds a Makefile;
 - **`rmemptydir`**: remove empty directories;
 - **`sensors`**: print the status of the sensors every second;
 - **`setvar`**: check if a variable with the name exists; if not, query for a value;
 - **`shlint`**: download the latest version of Haskell lint and run this version;
 - **`sleep_for`**: sleep a given number of hours;
 - **`sleep_survey`**: a short survey about sleep quality;
 - **`smartwatch`**: determine how long it will take to load the smartwatch;
 - **`sortit`**: sort the given files and copy the result to the original files;
 - **`stackb`**: build the haskell stack project with all warnings enabled;
 - **`stackbench`**: to run benchmarks on the haskell stack project, and write the results to a file named `benchmarks.html`;
 - **`stackd`**: build the documentation of the Haskell stack project;
 - **`stackg`**: run a ghci session for the given Haskell stack project;
 - **`stackr`**: run the program, this is an alias of `stack run`;
 - **`stackt`**: test the Haskell stack project;
 - **`stacktcov`**: test the Haskell project, and keep track of the coverage;
 - **`summarize`**: ask *Groq* to summarize the text from the *stdin*;
 - **`swapfiles`**: swap two or more files by renaming the second to the first, the third to the second, and the first to the last;
 - **`task`**: wrapper for `/usr/bin/task`, except that it reports tasks after the modification;
 - **`taskd`**: set the task with the given id as done;
 - **`taskflush`**: set all expired tasks to done;
 - **`teeth`**: help cleaning teeth;
 - **`timestamp`**: get a string that specifies date and time, used for filenames mainly;
 - **`todo`**: add or inspect to a todo list;
 - **`unpart`**: look for parts with a corresponding file;
 - **`update_system`**: update the system in an asynchronous way;
 - **`videos`**: see random videos;
 - **`vimc`**: create a directory if the directory does not yet exists before running `vim`;
 - **`vimp`**: use vim with different tabs, a shortcut for `vim -p`;
 - **`vimpsrc`**: open all the Haskell files in the `src` directory with `vim`;
 - **`waitfor`**: takes an argument and waits that amount of time with a countdown;
 - **`wakeup`**: make some noise to wake someone up;
 - **`washingmachine`**: wait until the washing machine has finished;
 - **`weather`**: obtain the weather based on GeoIP;
 - **`whatday`**: write the date in a color of the week;
 - **`wrapampel`**: set the terminal title with the ampel signs between the start and the end of the given command; and
 - **`...`**: move to the root directory of the git repository, if that exists.

## Emoji aliasses

The following emoji aliasses can be used as commands:

 - **`🚨`**: alias for `alarm`;
 - **`🩸`**: alias for `blooddonation`;
 - **`☕`**: alias for `coffee`;
 - **`🍽️`**: alias for `dishwasher`;
 - **`🥚`**: alias for `eggs`;
 - **`🤖`**: alias for `groq`;
 - **`🎥`**: alias for `movie`;
 - **`🍅`**: alias for `pomodoro`;
 - **`💼`**: alias for `pomodoro`;
 - **`😴`**: alias for `sleep_for`;
 - **`⌚`**: alias for `smartwatch`;
 - **`🦷`**: alias for `teeth`;
 - **`🌄`**: alias for `wakeup`; and
 - **`👕`**: alias for `washingmachine`.

## Variables

 - **`COFFEE_MAX`**: end time of the day when coffee is no longer allowed, for example `1900`;
 - **`COFFEE_MIN`**: start time of the day when coffee is allowed in decimal notation, for example `0800`;
 - **`GIT_BRANCH`**: the default branch, used to automatically map the remote to the local default branch in `gitremote`;
 - **`GIT_REPO_PREFIX`**: the prefix of (most) git repositories, for example `github:hapytex`;
 - **`GROQ_API_TOKEN`**: the API token for *Groq* to make chatbot requests, can be found [here](https://console.groq.com/keys); and
 - **`USER_SLUG`**: the slug used to prepend to file names when adding an author to it, for example `Elon_Musk`.

## Installation

One can install this by downloading (or cloning) and put the files in the `~/.config/fish/functions/`
directory.

You can of course also clone this repository at that location and thus *pull* new changes directly to the configuration directory:

```bash
git clone github.com/hapytex/fishing.git ~/.config/fish/functions/
```
