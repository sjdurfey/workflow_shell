#!/bin/bash
#===== Static Vartiables =========
PROJECT_NAME="Workflow Shell"

#=====/Static Vartiables =========



#===== Private Functions =========

add_path () {
    echo $'\n'#$PROJECT_NAME Path$'\n'export PATH='$PATH:'$1/bin >> $2
}

#=====/Private Functions =========


#Find where this script exists
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" 
done
SCRIPT_DIRECTORY="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

#Look for the different profile files. 
if [ -e $HOME/.zsh_profile ] #Lots of people are using zshell these days
    then
    echo "Adding a PATH entry for $SCRIPT_DIRECTORY/bin to $HOME/.zsh_profile"
    add_path $SCRIPT_DIRECTORY $HOME/.zsh_profile
    source $HOME/.zsh_profile
elif [ -e $HOME/.bash_profile ] #They might not have zshell installed
    then
    echo "Adding a PATH entry for $SCRIPT_DIRECTORY/bin to $HOME/.bash_profile"
    add_path $SCRIPT_DIRECTORY $HOME/.bash_profile
    source $HOME/.bash_profile
else
    #As a fallback, just in case both of those don't exist, add it to the generic .profile
    echo "Adding a PATH entry for $SCRIPT_DIRECTORY/bin to $HOME/.profile"
    add_path $SCRIPT_DIRECTORY $HOME/.profile
    source $HOME/.profile
fi
