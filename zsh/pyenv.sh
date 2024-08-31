# install pip for python3
sudo apt-get install python3-pip

# get pyenv and execute it
curl https://pyenv.run | bash

# clone virtualenvwrapper for pyenv
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper

echo '' >> ~/.zshrc
echo '# pyenv settings' >> ~/.zshrc
echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
echo 'export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENT="true"' >> ~/.zshrc
echo 'export PATH="~/.local/bin:$PATH"' >> ~/.zshrc
echo 'pyenv virtualenvwrapper_lazy' >> ~/.zshrc

### Install python
[[ -d ~/.pyenv/versions/3.10.2 ]] || ~/.pyenv/bin/pyenv install 3.10.2
pyenv global 3.10.2

# install virtualenvwrapper from pip
pip install virtualenvwrapper
