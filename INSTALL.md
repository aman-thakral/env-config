# Ubuntu
```
sudo apt-get update
sudo apt-get -y install htop \
curl s3cmd wget git python-dev \
python-software-properties \
vim emacs tree \
libblas-dev liblapack-dev libatlas-base-dev gfortran \
libfreetype6-dev meld libffi-dev libssl-dev
```

# Global Python
pip install jedi
pip install flake8
pip install importmagic
pip install autopep8
pip install yapf
pip install ipython
pip install jupyter

# Emacs via package-install
color-theme
neotree
elpy
virtualenv
virtualenvwrapper
yaml-mode
json-mode

# Symlinks
ln -s ~/dev/env-config/flake8 ~/.config/flake8
ln -s ~/dev/env-config/.emacs ~/.emacs
ln -s ~/dev/env-config/.gitignore_global ~/.gitignore_global

# Git
git config --global core.excludesfile '~/.gitignore_global'
