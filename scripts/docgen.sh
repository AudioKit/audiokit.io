#!/bin/bash

# Sources:
#   - https://github.com/apple/swift-docc-plugin
#   - https://apple.github.io/swift-docc-plugin/documentation/swiftdoccplugin/
#   - https://apple.github.io/swift-docc-plugin/documentation/swiftdoccplugin/generating-documentation-for-hosting-online
#   - https://www.swift.org/documentation/docc/
#   - https://www.swift.org/documentation/docc/distributing-documentation-to-other-developers

# Define the documentation directory.
# This should be the directory where the Package.swift lives for generating DocC documentation.
documentation_directory="$(pwd)/Docs"

# Define the output directory.
# The output directory should be relative to the documentation directory,
# and it must be a directory that already exists.
# If no output directory is defined, use the documentation directory.
output_directory=${1-$documentation_directory}

# Step into documentation directory.
cd $documentation_directory

# Define a function for generating a .doccarchive.
generate_archive() {
    product=$1

    echo "Generating archive for ${product} in ${output_directory}..."

    swift package --allow-writing-to-directory $output_directory \
        generate-documentation \
        --product $product \
        --hosting-base-path $product \
        --output-path "${output_directory}/${product}.doccarchive"

    # TODO: Once we can confirm the above is working, try enabling the following flags:
    # --disable-indexing # apparently only necessary for IDE documentation navigation
}

# Add new entries for every product here.
# Note that this will only work with PRODUCTS within your dependency graph,
# if you need to work with targets, you'll have to update this script.
generate_archive AudioKit
generate_archive Keyboard
generate_archive PianoRoll
generate_archive Tonic
