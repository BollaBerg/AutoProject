#!/bin/bash

function create {
    USE_GIT=1
    PROJECT_NAME=''
    ROOT_FOLDER='/mnt/c/Users/andre/Documents/Dev/'
    OTHER_ARGUMENTS=()

    for arg in "$@"
    do
        case $arg in
            -h|--help)
                echo "This script creates a folder for your project."
                echo "Example of use: 'create myProject'"
                echo "NOTE: Always end the command with your project name!"
                echo ""
                echo "You may use the following flags:"
                echo -e "\t-h or --help\tHelp is here!"
                echo -e "\t-ng or --nogit\tCreates project, but does nothing related to Git"
                echo -e "\t-r or --root\tChanges root folder to the next argument. Use at own caution!"
                echo ""
                echo "Example of use with flags:"
                echo "create -ng --root /local/bin/myFolder myProject"
                return "Please try again"
                ;;
            -ng|--nogit)
                USE_GIT=0
                shift # Remove option from $@-stack
                ;;
            -r|--root)
                ROOT_FOLDER="$2"
                shift # Remove option from $@-stack
                shift # Remove option from $@-stack
                ;;
            *)
                OTHER_ARGUMENTS+=("$1")
                shift # Remove option from $@-stack
                ;;
        esac
    done

    PROJECT_NAME="${OTHER_ARGUMENTS[-1]}" # Project name should ALWAYS be last argument

    cd $ROOT_FOLDER

    # Make directory if it does not already exist:
    if [[ ! -e $PROJECT_NAME ]]; then # No file/dir with name PROJECT_NAME
        mkdir "$PROJECT_NAME"
    elif [[ ! -d $PROJECT_NAME ]]; then
        echo "$PROJECT_NAME already exists but is not a directory"
        mkdir "$PROJECT_NAME"
    else
        return "Directory named $PROJECT_NAME already exists. I do not want to go on!"
    fi

    cd "$PROJECT_NAME"

    # if(($USE_GIT==1))
    # then
    #     python3 /mnt/c/Users/andre/Documents/Dev/Scripts/AutoProject/createProject.py $PROJECT_NAME

    #     git init
    #     git remote add origin https://github.com/BollaBerg/$1.git
    #     touch README.md
    #     git add .
    #     git commit -m "Initial commit"
    #     git push -u origin master
    # fi

    code .
}