#!/bin/bash

# Define our working directory.
working_directory=$(pwd)

# Define our temporary directory for cloning repositories, which ensures proper cleanup.
temp_directory="${working_directory}/.temp"

# If our command failed previously, we may need to delete the temporary directory.
rm -rf $temp_directory

# Create the temporary directory if it does not already exist, then step into it.
mkdir $temp_directory
cd $temp_directory

# Clone the repository, then step into it.
git clone https://github.com/AudioKit/docgen
cd docgen

# Define our documentation directory.
# This corresponds to Vapor's public file directory.
documentation_directory="${working_directory}/Docs"

# Delete our documentation directory and recreate it.
# This ensure stale documentation won't carry-over, such as in the event of an error.
rm -rf $documentation_directory
mkdir $documentation_directory

# Run the docgen command.
scripts/generate.sh $documentation_directory

mv "${documentation_directory}/docs.zip"

# Finally, remove our temp directory and all cloned repositories.
rm -rf $temp_directory

cd $working_directory
scripts/menu.sh

 