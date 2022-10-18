# LINUX AUTOMATION CONFIGURATION

## steps to configure your linux

1. Adding symlinks
```
ln -s ~/linux-configuration/zshrc ~/.zshrc
ln -s ~/linux-configuration/zshenv ~/.zshenv
ln -s ~/linux-configuration/vimrc ~/.config/nvim/init.vim
```

this file gives you some relevant configurations when you are starting on Linux Ubuntu

* Auto compiler
* git config

## AUTO COMPILER

auto compiler is a way to run your cpp,java,python and ruby files automatically

### how to added?

first you have to add an alias on your bashrc, which run "bash /specific-route/linux-configuration/auto_compiler.sh", where specific-route is the absolute route of your linux-coniguration directory

### how it works?

You just have to run auto_compiler.sh, and it will compile (if needed) and execute the most recent valid file, if you don not want the most recent, you can include the flas --file followed by the specific file

for example:
./auto_compiler.sh #it will execute the most recent valid file
./auto_compiler.sh --file somefile.cpp #it will compile and execute somefile.cpp

## GIT CONFIG
