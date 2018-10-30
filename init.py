#!/usr/bin/env python3

import os
from os import path
import shutil

script_dir = path.dirname(path.abspath(__file__))

shutil.copy(path.join(script_dir, "Makefile"), os.curdir)

if not path.exists(".gitignore"):
    shutil.copy(path.join(script_dir, ".gitignore"), os.curdir)

if not path.isdir("src"):
    os.mkdir("src")
if not path.isdir("vendor"):
    os.mkdir("vendor")

# vendor directory should be initialized
# if there are no dependencies then store a .gitignore file so git creates the directory,
# but if there are submodules git will create the directory automatically.
if not path.exists("vendor/.gitignore") and not path.exists(".gitmodules"):
    shutil.copy(path.join(script_dir, "vendor", ".gitignore"), "vendor/")

def to_camel_case(s):
    """Convert s, with words separated by -, into CamelCase."""
    words = s.split("-")
    return "".join([word.capitalize() for word in words])

if not path.exists("libname"):
    dirname = path.basename(os.getcwd())
    libname = to_camel_case(dirname.lstrip("coq-"))
    with open("libname", "w") as f:
        f.write(libname + "\n")
