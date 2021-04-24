# Fishing

A set of functions for the Friendly Interactive SHell (FISH).

## List of functions

 - **`edithaskell`**: will run the editor with the `.cabal` file(s) and the `.hs` files in the `src/` directory.
 - **`frmclip`**: copy from the clipboard to the stdout;
 - **`hlint`**: run Haskell lint and use a pager for the results;
 - **`igrep`**: run grep in a case insensitive way;
 - **`lessr`**: run `less` but allow to render ANSI terminal directives like color, etc.
 - **`numpy`**: start a Python shell with `numpy` imported;
 - **`pandas`**: start a Python shell with `numpy` and `pandas` imported;
 - **`rmemptydir`**: remove empty directories; and
 - **`shlint`**: download the latest version of Haskell lint and run this version.

## Installation

One can install this by downloading (or cloning) and put the files in the `~/.config/fish/functions/`
directory. You can of course also clone this repository at that location and thus
*pull* new changes directly to the configuration directory.
