#!/usr/bin/env python
#ah fuck bash, will learn it one day

import subprocess, os
home = os.getenv('HOME')


def cmd_exists(cmd):
    return subprocess.call("type " + cmd, shell=True, stdout=subprocess.PIPE, stderr=subprocess.PIPE) == 0

if cmd_exists('yum'):
    subprocess.call(['yum', 'update', '-y'])
    subprocess.call(['yum', 'install', 'epel-release', '-y'])
    subprocess.call(['yum', 'install', 'emacs', 'iftop', 'htop', 'tmux', 'git', 'python-setuptools', 'build-essential', 'scrot', 'ipython', 'python-virtualenvwrapper', 'bind-utils', '-y'])

elif cmd_exists('apt-get'):
    subprocess.call(['apt-get', 'update', '&&', 'apt-get', 'upgrade'])
    subprocess.call(['apt-get', 'install', 'emacs', 'iftop', 'htop', 'tmux', 'git', 'python-setuptools', 'build-essential', 'scrot', 'ipython', 'virtualenvwrapper', '-y'])

