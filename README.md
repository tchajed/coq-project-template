# Example Coq project setup

There's a script `init.py` in this repo which will set up a new project for you. It can also work on an existing project, but note that it overwrites your Makefile.

## Adding a dependency

To add a library as a dependency, do the following:

1. Run `git submodule add <repo url> vendor/<lib name>` from the root of your repo.
2. Also add any dependencies of your library in the same way.
3. You can now refer to the library's code prefixed by `Libname.`

For example, to add this library you would do:

`git submodule add https://github.com/tchajed/coq-lib-example vendor/example`.

## Manual setup

Copy this repo's `Makefile` and `.gitignore`. You should put your library's top-level namespace in the file `libname` (this is the root of all modules in your library within Coq) As a convention we use the CamelCase name of the library.

Your code should go in `src` (possibly in subdirectories). You'll also need a `vendor` directory to hold dependencies (even if it's empty).
