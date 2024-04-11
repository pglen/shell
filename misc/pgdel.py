#!/usr/bin/env python3

import os, sys

if sys.version_info[0] < 3:
    print("Python 2 is not supported as of 1/1/2020")
    sys.exit(1)

import getopt, signal, select, string, time, glob
import tarfile, subprocess, struct, platform, shutil, argparse

''' Delete file by moving to temp '''

parser = argparse.ArgumentParser(prog="pgdel.py", description=\
                'Delete files by moving to /tmp directory.')
parser.add_argument("delname", nargs="+", help="File(s) to delete. Wildcard OK", action="append")
parser.add_argument("-v", '--verbose', dest='verbose',
                    default=0,  action='count',
                    help='verbosity on (default: off)')

parser.add_argument("-V", '--version', dest='version',
                    default=0,  action='count',
                    help='Show version number.')

version = "1.0.0"

#print(sys.argv)

tmptarg = "/tmp/pgdel"


def copydir(aa):

    ''' Recursively copy '''

    ttt = os.path.join(tmptarg, aa)
    try:
        if args.verbose > 1:
            print("moving", aa, ttt)
        shutil.copytree(aa, ttt, dirs_exist_ok=True)
        shutil.rmtree(aa)
    except:
        for bb in range(2):
            fname2 = "%s_%d" % (ttt, bb)
            if not os.path.exists(fname2):
                break
        try:
            #print("ren", aa, fname2)
            if os.path.exists(fname2):
                shutil.rmtree(fname2)
                shutil.move(ttt, fname2)
        except:
            print("rename", sys.exc_info())

        if args.verbose > 1:
            print("Renaming:", ttt, "to", fname2)
        try:
            shutil.copytree(aa, ttt, dirs_exist_ok=True)
            shutil.rmtree(aa)
            #shutil.move(aa, tmptarg)
        except:
            print("move2", ttt, sys.exc_info())

def copyfile(aa):

    ttt = os.path.join(tmptarg, aa)
    if os.path.isfile(ttt):
        for bb in range(2):
            fname2 = "%s_%d" % (ttt, bb)
            if not os.path.exists(fname2):
                break
        try:
            if os.path.exists(fname2):
                os.remove(fname2)
            os.rename(ttt, fname2)
        except:
            print("File rename", sys.exc_info())
    try:
        shutil.copy2(aa, tmptarg)
        os.remove(aa)
    except:
        print("copyfile", aa, ttt, sys.exc_info())

def mainfunct():
    global args
    args = parser.parse_args()
    #print(args);  sys.exit()

    if args.version:
        print("pgdel.py Version", version)
        sys.exit()

    if not os.path.isdir(tmptarg):
        os.mkdir(tmptarg)

    for arg in args.delname[0]:
        for aa in glob.glob(arg):
            if args.verbose > 1:
                print("processing:", aa)
            if not os.path.exists(aa):
                if args.verbose:
                    print("'" + aa + "'", "does not exist.")
                    continue

            if os.path.isfile(aa):
                copyfile(aa)
            else:
                copydir(aa)

if __name__ == '__main__':
    mainfunct()

# EOF