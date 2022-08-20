#!/bin/bash

# Define our working directory.
working_directory=$(pwd)

# Define our documentation directory.
# This corresponds to Vapor's public file directory.
documentation_directory="${working_directory}/Public/documentation"

# Define our products to generate documentation for.
# products='AudioKit PianoRoll'

# Define our temporary directory for cloning repositories, which ensures proper cleanup.
temp_directory="${working_directory}/temp"

# Create the temporary directory if it does not already exist, then step into it.
mkdir $temp_directory
cd $temp_directory

# Clone the repository, then step into it.
git clone https://github.com/bdrelling/AudioKitDocs
cd AudioKitDocs

# Delete our documentation directory and recreate it.
# This ensure stale documentation won't carry-over, such as in the event of an error.
rm -rf $documentation_directory
mkdir $documentation_directory

# Run the docgen command.
swift run docgen AudioKit PianoRoll --output $documentation_directory

# Finally, remove our temp directory and all cloned repositories.
rm -rf $temp_directory
