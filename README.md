# vim-pythonic-environment-set-up
Project for providing best experience for python apps development 

The .vimrc file is based off the following tutorial https://realpython.com/vim-and-python-a-match-made-in-heaven/

I've added some features:
- Save a session (many open windows), as well as save modified files and exit run **:mks!** an a Session.vim file will be created. For save and exit run **:Xs**
- Running the current window script pressing **py**
- Integrated terminal macros hitting **Ctrl+t** To quit the terminal macros use **Ctrl+Backslash** with **Ctrl+n** and finally **:q!**
- Remap **Esc** to **jk** This actually helps get you more confortable and faster. 

Next new feature could be to open jupyter notebooks.

Feel free to contribute to this project requesting a PR from your new feature's branch. 

## Step for installing this configuration
### 1) You should first install vim
```
sudo apt-get update
sudo apt-get install vim
```
### 2) Clone the repository and copy .vimrc file to your home /home/username/
```
git clone https://github.com/3rickfs/vim-pythonic-environment-set-up.git
cd vim-pythonic-environment-set-up
cp ./vim-pythonic-environment-set-up /home/username/
```
### 3) Clone the Vundle repo to manage your vim's extensions
```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
### 4) Compile YouCompleMe
```
sudo apt install build-essential cmake vim-nox python3-dev
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_current.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt install mono-complete golang nodejs openjdk-17-jdk openjdk-17-jre npm
cd ~/.vim/bundle/YouCompleteMe
python3 install.py --clangd-completer
```
### 5) Fire up VIM and run:
```
:PluginInstall
```
