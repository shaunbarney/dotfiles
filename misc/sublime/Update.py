import os
import shutil

files = os.listdir(".")

for f in [i for i in files if
	i.endswith(".sublime-snippet") or
	i.endswith(".sublime-settings") or
	i.endswith(".sublime-build")]:
	shutil.copy2(os.path.join(os.getcwd(),f), "/Users/Zihao/Library/Application Support/Sublime Text 3/Packages/User/")

print("sublime updated")