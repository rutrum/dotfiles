cat software/apt.list | xargs -- sudo apt -y -qq install
cat software/snap.list | xargs -- sudo snap install --classic
