# CLI-compdev
Command Line Interface for Unix-like OS and Windows OS that helps you to start a project for the development of your own compiler.

## Table of Contents
1. [Directory Structure](#directory-structure)
2. [How to install `CLI-compdev`](#how-to-install-cli-compdev)
    - [On `MacOS`](#on-macos)
    - [On `Windows`](#on-windows)
3. [Get started with `compdev`](#get-started-with-compdev)
4. [Community collaboration](#community-collaboration)
5. [Changelog](#changelog)

## Directory Structure
This is the tree chart of the project structure.

```
|--- /conifg
|    |--- /modules
|    |    |--- /java_cup
|    |    |--- /jflex
|    |
|    |--- /win_makefile
|    |    |--- /Makefile
|    |
|    |--- /Makefile
|    |--- /parser.cup
|    |--- /scanner.jflex
|
|--- /unix
|    |--- /compdev.sh
|
|--- /windows
     |--- /compdev.sh
     |--- /compdev.bat
```

## How to install `CLI-compdev`

Download CLI-compdev release from [here](https://github.com/andrea-deluca/CLI-compdev/releases), unzip the getted archive and follow the guide for your OS.

### On `MacOS`

Before starting, you can delete `windows` and `config/win_makefile` folders.

#### 1. Setting up `config` folder 
Move `config` folder wherever you want on you MacOS. 

I suggest you to create a new directory, e.g. `~/Documents/compdev`, where you can easily put the `config` folder. 

Be sure you remember where you put this directory because you are going to use its path.

#### 2. Setting up `compdev.sh` file
Open `unix` folder and edit `compdev.sh` file. You have to replace `config_path` constant at the beginning of the file with the path to `config` folder.

```sh
#!/bin/bash

program=compdev
current_dir=.

# path to program config folder
config_path=path/to/config/folder   # Edit this, e.g.
                                    # config_path=~/Documents/compdev/config

[...]
```

#### 3. Move `compdev.sh` to the correct location
Open Terminal application, navigate to the folder where you have `compdev.sh` and move the file into `/usr/local/bin` system directory with the command below.

```bash
sudo mv ./compdev.sh /usr/local/bin/COMPDEV
```

As `/usr/local/bin` directory is owned by user root, you must be an admin and use `sudo` to move files there.

#### 4. Set owner and permissions
The script should be owned by and writable for root, but readable and executable for everyone. The two commands below ensure this:

```bash
sudo chown root: /usr/local/bin/COMPDEV
sudo chmod 755 /usr/local/bin/COMPDEV
```

### On `Windows`

Be sure you have [`WSL`](https://docs.microsoft.com/it-it/windows/wsl/install) installed on your PC before starting install `compdev`.

Before starting, you can delete `unix` folder and `config/Makefile` file.

#### 1. Setting up `config` folder
Move `config` folder wherever you want on your Windows. 

I suggest you to create a new directory, e.g. `C:\Users\Andrea\Documents\compdev`, where you can easily put the `config` folder. 

Be sure you remember where you put this directory because you are going to use its path.

#### 2. Setting up `compdev.sh` file
Open `windows` folder and edit `compdev.sh` file. You have to replace `config_path` constant at the beginning of the file with the path to `config` folder.

```sh
#!/bin/bash

program=compdev
current_dir=.

# path to program config folder
config_path=path/to/config/folder/in/wsl    # Edit this, e.g.
                                            # config_path=/mnt/c/Users/Andrea/Documents/compdev

[...]
```

#### 3. Move `compdev.sh` and `compdev.bat` to the correct location
Move `compdev.sh` and `compdev.bat` files into `C:\Windows\System32` folder.

## Get started with `compdev`

You can use `compdev` to create a project already formatted and possibly templated for the development of your own compiler.

For now, you can use it just with `jflex` and `java_cup`, because just their module are loaded into `config/module` folder and, morover, templated and non-templated initialization is based on them.

The complete list of command at the moment available is shown below.

### `init`

You can use `compdev init` to initialize your project.

```bash
$ compdev init <project_name> [--template]
```

You should type the name of your new project instead of `<project_name>`, but you can also type `.` instead of `<project_name>` to initialize your project in the current directory where you are running this command.

The default initialization, without `--template` option, create the following project structure:

```
|--- /<project_name>
     |--- /build
     |--- /modules
     |--- /source
     |    |--- /scanner.jflex
     |    |--- /parser.cup
     |
     |--- /Makefile
```

The `--template` option is not mandatory, but, if you use it, the project is initialized with `jflex` and `java_cup` preloaded into `modules` folder. In addition, `scanner.flex`, `parser.cup` and `Makefile` are templated on the same files you can find within `config` folder. Here the `--template` option project structure:

```
|--- /<project_name>
     |--- /build
     |--- /modules
     |    |--- /java_cup
     |    |--- /jflex
     |
     |--- /source
     |    |--- /scanner.jflex (Templated)
     |    |--- /parser.cup (Templated)
     |
     |--- /Makefile (Templated)
```

### `add`

If you have already initialized your project, maybe without `--template` option, and you want to add a module, you can use the `compdev add` command.

```bash
$ compdev add <module_name>
```

At the moment, just `jflex` and `java_cup` are defined as modules and just them are within the `config` folder. So you can use just their name instead of `<module_name>`.

### `help`

For info about commands available, you can run `compdev help`.

```bash
$ compdev help
```

## Community collaboration

I would be very happy if you expanded this project.

You can expand and edit `compdev` with whatever you want. You can add new modules and new templates by means editing source code and you can also suggest optimizations or prettier code.

In addition, I also suggest you to watch [issues](https://github.com/andrea-deluca/CLI-compdev/issues).

I know this program is not perfect but I think it can be a good starting point, so you are welcome!

## Changelog

Here you can check changes between software releases.

### `v0.0.1`
- Release of `compdev` for Unix-like OS and Windows. 
- Just `jflex` and `java_cup` modules support available.
