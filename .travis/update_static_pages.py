#!/usr/bin/env python

from os.path import abspath, join, basename, dirname, isdir
from os import listdir


docsdir = abspath(join(dirname(abspath(__file__)), '..','docs'))
tpl = join(docsdir, '_header.md')
out = join(docsdir, 'index.md')
with open(out, 'wb') as index:
    index.writelines(open(tpl, 'rb').read())
    for dir in listdir(docsdir):
        fulldir = join(docsdir, dir)
        if not isdir(fulldir):
            continue
        subs = [d for d in listdir(fulldir) if isdir(join(fulldir, d))]
        index.write('- {}'.format(dir))
        for sub in subs:
            index.write('{1}- {2} [main]({dir}/{sub}/index.html) [class index]({dir}/{sub}/classes.html)'.format(' '*4, sub, dir))

