#!/bin/bash

working_directory=$(pwd)
temporary_directory="${working_directory}/temp"

# crate the temp directory
mkdir $temporary_directory

# step into the temp directory
cd $temporary_directory

# clone the repo
git clone https://github.com/AudioKit/AudioKit

# step into the repo
cd AudioKit

# create the documentation directory if needed
documentation_directory="${working_directory}/Public/documentation"
mkdir $documentation_directory

# set the audiokit archive output path
audiokit_documentation_directory="${documentation_directory}/AudioKit.doccarchive"

# generate the archive
swift package --allow-writing-to-directory $documentation_directory \
    generate-documentation --product AudioKit --output-path $audiokit_documentation_directory \
    --hosting-base-path AudioKit

# keeping this comment around just to see which is better later on
# --transform-for-static-hosting

# delete the temporary directory
rm -rf $temporary_directory
