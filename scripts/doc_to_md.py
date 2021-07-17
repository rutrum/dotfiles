import os
import subprocess
import glob

for filename in glob.glob("*.docx"):
    basename = filename.split(".")[0]
    newname = subprocess.check_output("/home/rutrum/.cargo/bin/ccase -t snake \"{}\"".format(basename), shell=True).decode('utf-8').strip() + ".md"
    print(newname)
    subprocess.check_output("/usr/bin/pandoc \"{}\" -f docx -t markdown -o {}".format(filename, newname), shell=True)
