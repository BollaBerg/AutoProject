# AutoProject
Automating the boring parts of starting a new project: creating a directory, creating a Git repository and making that first commit - so you (I) can get to the fun parts faster

## Getting started
These instructions will get you a copy of the project up and running.

### Prerequisites
You only need to have Python3 and pip installed. Installing those should be easy.


### Installing
A step by step instruction to get everything running

Clone from Git and install requirements:
```
git clone "https://github.com/BollaBerg/AutoProject.git"
cd AutoProject
pip install -r requirements.txt
```

Change username and directories in the file. This should be in the following places in the code:

| File              | Location | What? |
|-------------------|----------|-------|
|createProject.py   |line 5    |Github username|
|create.sh          |line 6    |Root folder|
|create.sh          |line 63   |Location of your createProject.py-file|
|create.sh          |line 66   |Github username|

#### Source create.sh
This can either be done manually:
```
source ./create.sh
```
Or automatically when you launch your terminal. I prefer to have a .bash_scripts in .bashrc, but you can do this by adding the following line to .bashrc (replace [LOC] with the location of create.sh on your system):
```
. [LOC]/create.sh
```

## Use
Using AutoProject is easy! After following the instructions above, simply open your terminal and write:
```
create projectName
```

I have implemented the following flags:

|Flag       |Input          |Does:|
|-----------|-----------    |--------|
|Help       |-h or --help   |Shows possible flags and examples of use|
|NoGit      |-ng or --nogit |Disables all Git use|
|Root       |-r or --root   |Lets the user choose a different root directory|

Example with flags:
```
create -ng --root another/destination ProjectName
```
