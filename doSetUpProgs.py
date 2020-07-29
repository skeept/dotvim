#!/usr/bin/env python

# vim: cc=80

__doc__ = """\
if the file is a directory, create a directory with the same name in usr,
if it doesn't exist
if the file is not a directory, just create a symbolic
link pointing to the file."""

# see in Packages/<package_name>

import os
import sys
import glob
import errno
import textwrap
from os.path import join, realpath, abspath, isdir, isfile


def force_symlink(file1, file2):
    try:
        os.symlink(file1, file2)
    except OSError as e:
        if e.errno == errno.EEXIST:
            os.remove(file2)
            os.symlink(file1, file2)


def usage():
    sys.stdout.write(
        textwrap.dedent(
            """\
  usage : program folder_origin [folder_destin]
          folder_origin is the original folder with all the files\
  and folders to be linked
          folder_destin is where you want to create symlinks, defaults to 'usr'
  """
        )
    )


def do_recursion(origin, dirname):
    AlternatePrefix = "usr"
    dirlist = glob.glob(dirname + os.sep + "*")
    for name in dirlist:
        newName = name.replace(origin, "")
        newName = AlternatePrefix + os.sep + newName
        if os.path.isdir(name):
            # check if file exists in usr/...
            if not isdir(newName):
                # create the directory there
                print("creating directory: ", newName)
                os.mkdir(newName)
            do_recursion(origin, name)
        else:
            print(name, " --> ", newName)
            if not isfile(newName):
                force_symlink(
                    os.getcwd() + os.sep + name, os.getcwd() + os.sep + newName
                )


def create_symlinks(origin, destin, display_passage=True):
    """we go over the files and folders in origin and create a symlink in destin
  folders if not existing will be explicitly created, others files symlinked"""
    origin = realpath(origin)
    destin = abspath(destin)
    os.chdir(origin)
    # make sure destin exists
    if display_passage is False and os.path.isdir(destin) is False:
        os.makedirs(destin)
    for root, dirs, files in os.walk(os.curdir):
        for dirn in dirs:
            # dir_orig = join(join(origin, root), dirn)
            dir_dest = join(join(destin, root), dirn)
            if os.path.exists(dir_dest) is False:
                if display_passage is True:
                    sys.stdout.write("%s does not exists, creating it.\n" % dir_dest)
                else:
                    os.makedirs(dir_dest)
        for filen in files:
            file_orig = realpath(join(join(origin, root), filen))
            file_dest = abspath(join(join(destin, root), filen))
            if display_passage is True:
                msg = "%35s ---> %s\n" % (file_orig, file_dest)
                sys.stdout.write(msg)
            else:
                force_symlink(file_orig, file_dest)

    if display_passage:
        msg = """\n\n
    Will perform the previous listed actions.
    Do you wish to continue? <ctrl-c> to abort"""
        input(msg)
        create_symlinks(origin, destin, display_passage=False)


# for now assume Packages/sys.argv[1] exists, and do the recursion here
prefixDir = "Packages"
# do_recursion(prefixDir + os.sep  + sys.argv[1] + os.sep,
# prefixDir + os.sep  + sys.argv[1])


def main():
    if len(sys.argv) < 2:
        usage()
        sys.exit(-1)
    origin = sys.argv[1]
    destin = "usr"
    if len(sys.argv) > 2:
        destin = sys.argv[2]
    # create_symlinks(sys.argv[1], '.')
    create_symlinks(origin, destin)


if __name__ == "__main__":
    main()
