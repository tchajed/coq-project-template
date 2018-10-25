# Example Coq project setup

Copy this repo's `Makefile`, `.gitignore,` and `_CoqProject`. You should customize `_CoqProject` so it remaps `src` to your own customized top-level namespace. As a convention we use the CamelCase name  of the library.

Your code should go in `src` (possibly in subdirectories).

To add a library, do the following:

1. Run `git submodule add <repo url> vendor/<lib name>` from the root of your repo.
2. Add `-R vendor/<lib name>/src <Lib namespace>` to `_CoqProject`.
3. Add any dependencies of the library in the same way.

For example, to add this library you would do:

1. `git submodule add https://github.com/tchajed/coq-lib-example vendor/example``.
2. Add `-R vendor/example/src Example` to `_CoqProject`.
