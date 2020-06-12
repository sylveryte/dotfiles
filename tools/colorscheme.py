import os
from sys import path
from random import shuffle
from itertools import cycle

class _GetchUnix:
    def __init__(self):
        import tty, sys

    def __call__(self):
        import sys, tty, termios
        fd = sys.stdin.fileno()
        old_settings = termios.tcgetattr(fd)
        try:
            tty.setraw(sys.stdin.fileno())
            ch = sys.stdin.read(1)
        finally:
            termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)
        return ch

class Color:
    def __init__(self, path, name):
        print(path)
        with open(path,'r') as colors:
            li=colors.readlines()
            shuffle(li)
            self.l=[x[:-1] for x in li]
        print(name)
        self.i = 0

    def next(self):
        #print(f'current {self.i} len {len(self.l)}')
        if len(self.l)-1 > self.i:
            self.i += 1
            #print("adeed")
            #print(f'current {self.i} len {len(self.l)}')
        else:
            self.i=0
            #print("zeroed`")
            #print(f'current {self.i} len {len(self.l)}')
        return self.l[self.i]

    def back(self):
        if self.i > 0:
            self.i-=1
        else:
            self.i=len(self.l)-1
        return self.l[self.i]

def apply(theme, l):
    print(f'applying {theme} with light {l}')
    if l:
        os.system("wal -l --theme "+theme)
    else:
        os.system("wal --theme "+theme)


if __name__ == "__main__":
    getch = _GetchUnix()
    c='l'
    l=True
    first = True
    theme='base16-harmonic'
    while True:
        if c == 'n':
            theme = master.next()
        if c == 'p':
            theme = master.back()
        if c == 't':
            l = not l
        if c == 'd':
            master = Color(os.path.join(path[0],'colors/dark'), 'dark')
            theme = master.next()
            l = False
        if c == 'l':
            master = Color(os.path.join(path[0],'colors/light'), 'light')
            theme = master.next()
            l = True
        if not first:
            apply(theme, l)
        first = False
        if c == 'r':
            os.system('wal --theme random_dark')
        if c == 'e':
            os.system('wal --theme random_light')
        c = getch()
        if c == 'q':
            break
