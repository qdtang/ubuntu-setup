#!/usr/bin/env python3

import os
import sys

JUMP_DIR_PATHS = os.path.join(os.getenv("HOME"), ".jumpdir.paths")
JUMP_DIR_EXE = os.path.join(os.getenv("HOME"), ".jumpdir.exe")
paths = set()

def addPath(path):
	if os.path.exists(path):
		paths.add(os.path.abspath(path))

def removePath(path):
	absPath = os.path.abspath(path)
	if absPath in paths:
		paths.remove(absPath)

def listPaths():
	for path in paths:
		print(path)

def loadPaths():
	try:
		f = open(JUMP_DIR_PATHS, "r")
	except IOError:
		return

	for line in f:
		paths.add(line.strip())
	f.close()

def findPath(keywords):
	for path in paths:
		for keyword in keywords:
			if path.rfind(keyword) == -1:
				break
		else:
			return path
	return None

def dumpPaths():
	with open(JUMP_DIR_PATHS, "w") as f:
		for path in paths:
			f.write("%s\n" % path)

def changeDir(path):
	with open(JUMP_DIR_EXE, "w") as f:
		f.write("cd %s\n" % path)

# both 0 and 1 mean success, but only 0 means "jump" is needed.
def exitWrapper(status, updated, path=os.curdir):
	if updated:
		dumpPaths()
	if status == 0:
		changeDir(path)
	sys.exit(status)

def usage():
   print('''
##Usage:
	Please add following alias for csh
		alias jd "/path/to/this/script \!* && source ~/.jumpdir.exe"
	Or, add a function for bash 
		function jd(){/path/to/this/script $* && source ~/.jumpdir.exe}
	After that jd allows you to jump among directories via keywords in the path.

	jd -h|--help
	   Display this help.
	jd -a [dir1 [, dir2...]]
	   Add dirs to the quick access paths. If no dir is specified, it would add current directory.
	jd -r [dir1 [, dir2...]]
	   Remove dirs from the quick access paths. If no dir is specified, it would remove current directory.
	jd -l
	   List the quick access paths.
	jd keyword1 [, keyword2...]
	   cd to the already added directory specified by the keywords.
	   Nothing happens if no directory is found.

##Example:
	% jd -a /home/user/work/project/src /home/user/play/src    #add 2 dirs into quick access paths
	% jd wo src     #jump to /home/user/work/project/src
	''')

def main():
	if len(sys.argv) < 2:
		usage()
		exitWrapper(-1, False)
	arg1 = sys.argv[1]
	if arg1 in ("-h", "--help"):
		usage()
		exitWrapper(1, False)
	loadPaths()
	updateFunc = {"-a":addPath, "-r":removePath}
	if arg1 in ("-a", "-r"):
		if len(sys.argv) == 2:
			updateFunc[arg1](os.curdir)
		else:
			for path in sys.argv[2:]:
				updateFunc[arg1](path)
		exitWrapper(1, True)
	elif arg1 == "-l":
		listPaths()
		exitWrapper(1, False)
	else:
		path = findPath(sys.argv[1:])
		if path == None:
			exitWrapper(-1, False)
		else:
			exitWrapper(0, False, path)


if __name__ == "__main__":
	main()
