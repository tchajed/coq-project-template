# Example Coq project setup

Copy this repo's `Makefile` and `.gitignore`. You should put your library's top-level namespace in the file `libname` (this is the root of all modules in your library within Coq) As a convention we use the CamelCase name  of the library.

Your code should go in `src` (possibly in subdirectories).

To add a library, do the following:

1. Run `git submodule add <repo url> vendor/<lib name>` from the root of your repo.
2. Also add any dependencies of your library in the same way.

For example, to add this library you would do:

`git submodule add https://github.com/tchajed/coq-lib-example vendor/example`.
