#!/usr/bin/env python
#ah fuck bash, will learn it one day

import subprocess, os
home = os.getenv('HOME')

def path_exists(path):
    return subprocess.call("ls " + path, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) == 0

with open(".bashrc", "r") as new_bashrc:
    with open(home + "/.bashrc", "a") as bashrc_orig:
        for line in new_bashrc:
            bashrc_orig.write(line)
        print "Appended to ~/.bashrc"


subprocess.call(["cp", ".tmux.conf", "%s/.tmux.conf" % home])
print "Copied new tmux config to ~/.tmux.conf"

            
if path_exists('~/.emacs'):
    with open(".emacs", "r") as new_emacs:
        with open(home + "/.emacs", "a") as emacs_orig:
            for line in new_emacs:
                emacs_orig.write(line)
            print "Appended to ~/.emacs"

else:
    subprocess.call(["touch", "%s/.emacs" % home])
    with open(".emacs", "r") as new_emacs:
        with open(home + "/.emacs", "a") as emacs_orig:
            for line in new_emacs:
                emacs_orig.write(line)
            print "Appended to ~/.emacs"

print "You should restart Bash"

