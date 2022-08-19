#!/bin/bash

working_directory=$(pwd)

temp_directory="${working_directory}/temp"
output_directory="${working_directory}/Public/documentation"

mkdir $temp_directory
cd $temp_directory

git clone https://github.com/bdrelling/docgen-AudioKit
cd docgen-AudioKit

swift run docgen

cp /output

# rm -rf $temp_directory
