# AudioKit.io

## To Do

### Website

- [x] Create Vapor boilerplate.
- [x] Create system for generating `.doccarchive` across the AudioKit org. (see [AudioKitDocs](https://github.com/bdrelling/AudioKitDocs))
- [ ] Add Leaf and Plot examples for the AudioKit team.
- [ ] Migrate to AudioKit org and host!

### Middleware

- [x] Create DocC Middleware for Vapor to serve up multiple `.doccarchive`s without collisions.
- [ ] Fix the sidebar rendering.
- [ ] Allow the Middleware to serve static `.doccarchive`s.
- [ ] Clean up, optimize, and test the middleware, then break into a separate package.

## Running the Website

The first and only thing we need to do is add a working directory to our schemes to enable file middleware:

![Configure your working directory.](/.github/images/configure_working_directory.png)

You can run the website by hitting **Run** in Xcode or via `swift run Run` in the terminal.

## Generating Documentation

By default, documentation endpoints are disabled, as documentation is dynamically generated. This allows us to avoid keeping numerous ~6-12mb files in our repository.

If you want to enable documentation locally, just run the `scripts/docgen.sh` script _before_ running your website. This script generates documentation in the `Docs` directory, and all `.doccarchive` files are gitignored.

Currently by default documentation is served to `localhost:8080/<product>`, eg. (`localhost:8080/AudioKit` or `localhost:8080/PianoRoll`).

## Resources

- <https://josephduffy.co.uk/posts/hosting-docc-archives>
  - <https://vapordocc.josephduffy.co.uk/documentation/>
- <https://www.swift.org/documentation/docc/documenting-a-swift-framework-or-package>
- <https://betterprogramming.pub/how-to-host-your-docc-documentation-on-the-web-3561874ffd0a#f1a5>
