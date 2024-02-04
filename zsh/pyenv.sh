# install pip for python3
sudo apt-get install python3-pip

# install virtualenvwrapper from pip
pip install virtualenvwrapper

# get pyenv and execute it
curl https://pyenv.run | bash

export PATH="~/.local/bin:$PATH"
export PATH="~/.pyenv/bin:$PATH"

# clone virtualenvwrapper for pyenv
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git $(pyenv root)/plugins/pyenv-virtualenvwrapper

eval "$(pyenv init -)"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENT="true"
pyenv virtualenvwrapper_lazy

### Install python
[[ -d ~/.pyenv/versions/3.10.2 ]] || pyenv install 3.10.2
pyenv global 3.10.2
