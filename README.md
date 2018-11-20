# Example Coq project setup

Run `aviary init` from this repo to set up a new project.

## Adding a dependency

To add a library as a dependency, do the following:

1. Run `git submodule add <repo url> vendor/<lib name>` from the root of your repo.
2. Also add any dependencies of your library in the same way.
3. You can now refer to the library's code prefixed by `Libname.`

For example, to add the [Tactical library](https://github.com/tchajed/coq-tactical) you would do:

`git submodule add https://github.com/tchajed/coq-tactical vendor/tactical`.

Alternately, you can use `aviary install tchajed/coq-tactical`.

## Manual setup

Copy this repo's `Makefile` and `.gitignore`. You should put your library's top-level namespace in the file `libname` (the entire file will be a single word). As a convention we use the CamelCase name of the library.

Your code should go in `src` (possibly in subdirectories), which is re-mapped in Coq to the top-level namespace given by `libname`.

For Travis CI, copy `travis.yml` to `.travis.yml` and then enable builds from <https://travis-ci.org>. The default setup builds against the two docker images, `coqorg/coq:dev` and `coqorg/coq:latest`, which correspond to a nightly build of `master` and the latest stable release.

## Credits

Many thanks to @anishathalye for helping to work out the design and implementation!

# Stability

This setup isn't remotely stable. In particular, we may move away from `make` and as soon as possible `libname` will be replaced by a more future proof and extensible configuration file.

# Projects using this

Here are some projects where I'm now using this (if you use it, please let me know!):

- [coq-tactical](https://github.com/tchajed/coq-tactical)
- [coq-simple-classes](https://github.com/tchajed/coq-simple-classes)
- [coq-sep-logic](https://github.com/tchajed/coq-sep-logic)
- [coq-record-update](https://github.com/tchajed/coq-record-update)
- [coq-array](https://github.com/tchajed/coq-array)
