#!/bin/bash 

function setup () {
    if [ ! -d "/home/$USER/trash" ]
    then
        mkdir /home/$USER/trash
        echo "Trash folder created!"
    else
        echo "There already is a trash folder on this computer."
    fi
}

function deleteDirectory(){
    echo "Do you want to delete directory "$2"? [y/n]"
    read selection
    if [ "$selection"="y" ] || [ "$selection" = "Y" ]
    then
        if [$1=-r]
        then
             zip -r "$2".zip $2 /home/$USER/trash/$2
             rm $2
        else
            echo "No valid arguments"
        zip "$2".zip "$2"
        fi
    else
        echo "File has not been deleted."
    fi
}

function deleteFile(){
    echo "Do you want to delete file "$1"? [y/n]"
    read selection
    echo $selection
    if [[ $selection == "y" || $selection == "Y" ]]
    then
        zip "$1".zip "$1"
        fileTrash $1
    else
        echo "File has not been deleted."
    fi
}

function fileTrash(){
    if [ ! -f "/home/$USER/trash/$1" ]
    then
        z= locateFile $1
        echo $z
        mv $z /home/$USER/trash/
    
    else
        x=locate $1
        echo x
        if [ x="/home/$USER/trash/$1" ]
        then
            cp -f x /home/$USER/trash/$1
            rm x
        fi
    fi
}

function locateFile(){
    locate $1
    echo "file located"
}

setup
deleteFile






