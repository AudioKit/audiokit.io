# AudioKit.io

[![CI Status](https://github.com/AudioKit/audiokit.io/actions/workflows/tests.yml/badge.svg)](https://github.com/AudioKit/audiokit.io/actions/workflows/tests.yml)
[![License](https://img.shields.io/github/license/AudioKit/audiokit.io)](https://github.com/AudioKit/audiokit.io/blob/main/LICENSE)

[**audiokit.io**](https://audiokit.io) hosts DocC documentation for all AudioKit packages.

## Running the Website

The first and only thing we need to do is add a working directory to our schemes to enable file middleware:

![Configure your working directory.](/.github/images/configure_working_directory.png)

You can run the website by hitting **Run** in Xcode or via `swift run Run` in the terminal.

## Adding Documentation

1. Follow the instructions in [`audiokit/docgen`](https://github.com/audiokit/docgen#adding-new-documentation). Make sure your changes are committed and pushed.
2. Run `scripts/docgen.sh` in _this_ repository.
3. Commit and push your changes.

The site will automatically re-deploy to both `development` and `production` environments.
