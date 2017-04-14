#!/bin/bash

# Author: Ivaylo Getov
# url: https://github.com/luxloop/LuxloopUnityBoilerplate

NEWNAME=$1
PROJECT_FOLDER=`pwd`
PROJECT_FOLDER_NAME=${PWD##*/}
CONTAINING_FOLDER="$(dirname "$PROJECT_FOLDER")"

# Get rid of default remote:
if [ -d "$PROJECT_FOLDER/.git" ]; then
  ORIGIN=$(git remote -v | grep LuxloopUnityBoilerplate | head -1 | awk '{print $1}')
  if [ -z "$ORIGIN" ]; then
    echo "..."
  elif [ "$ORIGIN" == 'origin' ]; then
    git remote rm origin
    echo "Removed default git remote"
  fi
else
  echo "Not a git repo. Don't Forget to \"git --init\""
fi

if [ -z "$1" ]
  then
    echo "Please enter new project name as argument"
else
  # Update Project Settings:
  sed -i "s/productName: Luxloop/productName: $NEWNAME/g" "$PROJECT_FOLDER/ProjectSettings/ProjectSettings.asset"
  sed -i "s/bundleIdentifier: com.Company.ProductName/bundleIdentifier: com.Company.$NEWNAME/g" "$PROJECT_FOLDER/ProjectSettings/ProjectSettings.asset"
  sed -i "s/metroPackageName: Luxloop_Boilerplate/metroPackageName: $NEWNAME/g" "$PROJECT_FOLDER/ProjectSettings/ProjectSettings.asset"
  sed -i "s/metroApplicationDescription: Luxloop_Boilerplate/metroApplicationDescription: $NEWNAME/g" "$PROJECT_FOLDER/ProjectSettings/ProjectSettings.asset"
  sed -i "s/LuxloopUnityBoilerplate.sln/$NEWNAME.sln/g" "$PROJECT_FOLDER/LuxloopUnityBoilerPlate.sublime-project"
  mv "$PROJECT_FOLDER/LuxloopUnityBoilerPlate.sublime-project" "$PROJECT_FOLDER/$NEWNAME.sublime-project"
  echo "Updated Project Settings"

  # Rename Project Folder:
  mv "$CONTAINING_FOLDER/$PROJECT_FOLDER_NAME" "$CONTAINING_FOLDER/$NEWNAME"
  echo "Renamed Project Folder"
fi
