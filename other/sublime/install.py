#!/usr/bin/env python3

import os
import shutil

files = os.listdir('.')

for f in files:
	if f.split('.')[-1].split('-')[0] == 'sublime':
		print(f)
		shutil.copy2(os.path.join(os.getcwd(),f), 
			os.path.expanduser('~/Library/Application Support/Sublime Text 3/Packages/User/'))

print("Sublime Text 3 Updated")
