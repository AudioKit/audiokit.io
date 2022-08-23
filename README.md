# AudioKit.io

## To Do

### Website

- [x] Create Vapor boilerplate.
- [x] Create system for generating `.doccarchive` across the AudioKit org. (see [AudioKitDocs](https://github.com/bdrelling/AudioKitDocs))
- [x] Add Leaf and Plot examples for the AudioKit team.
- [ ] Migrate to AudioKit org and host!

### Middleware

- [x] Create DocC Middleware for Vapor to serve up multiple `.doccarchive`s without collisions.
- [ ] Fix the sidebar rendering.
- [ ] Allow the Middleware to serve static `.doccarchive`s.
- [ ] Clean up, optimize, and test the middleware.

## Running the Website

The first and only thing we need to do is add a working directory to our schemes to enable file middleware:

![Configure your working directory.](/.github/images/configure_working_directory.png)

You can run the website by hitting **Run** in Xcode or via `swift run Run` in the terminal.

## Resources

- <https://josephduffy.co.uk/posts/hosting-docc-archives>
  - <https://vapordocc.josephduffy.co.uk/documentation/>
- <https://www.swift.org/documentation/docc/documenting-a-swift-framework-or-package>
- <https://betterprogramming.pub/how-to-host-your-docc-documentation-on-the-web-3561874ffd0a#f1a5>
