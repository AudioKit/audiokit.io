# Generating Documentation

When generating DocC documentation, it's typical to clone down a GitHub repository and generate the `.doccarchive` as needed. WWDC'22 introduced the thoroughly documented [swift-docc-plugin](https://github.com/apple/swift-docc-plugin), which allows us to generate documentation within the same package for products or targets.

This effectively means that we can get all of this out of the box just by dropping a `Package.swift` into our project, adding the plugin, and then adding any dependencies we plan to generate products for.
