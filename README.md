# Example Coq project setup

There's a script `init.py` in this repo which will set up a new project for you. It can also work on an existing project, but note that it overwrites your Makefile. The script does not set up Travis CI, but a [working Travis configuration](travis.yml) is included in this repo.

## Adding a dependency

To add a library as a dependency, do the following:

1. Run `git submodule add <repo url> vendor/<lib name>` from the root of your repo.
2. Also add any dependencies of your library in the same way.
3. You can now refer to the library's code prefixed by `Libname.`

For example, to add this library you would do:

`git submodule add https://github.com/tchajed/coq-lib-example vendor/example`.

## Manual setup

Copy this repo's `Makefile` and `.gitignore`. You should put your library's top-level namespace in the file `libname` (the entire file will be a single word). As a convention we use the CamelCase name of the library.

Your code should go in `src` (possibly in subdirectories), which is re-mapped in Coq to the top-level namespace given by `libname`.

For Travis CI, copy `travis.yml` to `.travis.yml` and then enable builds from <https://travis-ci.org>. The default setup uses Coq master. You can instead build against a different branch or commit of Coq by changing `COQ_VERSION`. The configuration isn't set up for using a released version of Coq rather than pinning to the repo.

## Stability

We will probably change this setup several times before even remotely attempting stability.
