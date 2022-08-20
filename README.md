# AudioKit.io

## Work In Progress

There are a few caveats that I need to work through still:

- The DocC middleware I found is extremely outdated, but I haven't touched it yet. I just wanted to make sure the archive could serve first. Absolute worst case scenario, we can simply server the archives statically, so there's no concern here.

- The DocC middleware also doesn't resolve conflicts across multiple DocC archives. Again, worst case scenario, static archives will be just fine.

- In developing the `docgen` command and script, there is definitely opportunity to make the process even easier. I'm going to update the library a bit further so that we can nuke the `AudioKitDocs` repo, but being able to use the plugin to get things off the ground was very helpful.

## Running the Website

The first and only thing we need to do is add a working directory to our schemes to enable file middleware:

![Configure your working directory.](/docs/configure_working_directory.png)

You can run the website by hitting **Run** in Xcode or via `swift run Run` in the terminal.

## Generating Documentation

By default, documentation endpoints are disabled, as documentation is dynamically generated on deployment.

If you want to enable documentation locally, just run the `scripts/docgen.sh` script, then re-run your website. This script generates documentation in the `Public/documentation` directory, which is gitignored.

Currently by default documentation is served to `localhost:8080/documentation/AudioKit`.

## Resources

- <https://josephduffy.co.uk/posts/hosting-docc-archives>
  - <https://vapordocc.josephduffy.co.uk/documentation/>
- <https://www.swift.org/documentation/docc/documenting-a-swift-framework-or-package>
- <https://betterprogramming.pub/how-to-host-your-docc-documentation-on-the-web-3561874ffd0a#f1a5>
