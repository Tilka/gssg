# Ghetto Static Site Generator
Because other static site generators are too damn complex.

## Features
- source code fits on one screen
- few requirements
- super-fast content generation
- example template generates valid HTML5
- supports extensions using Makefile syntax

## Requirements
- markdown (could easily be replaced with other input formats)
- make
- sh-compatible shell
- GNU grep


## User Guide
1. Write a markdown file.
2. Run `make`.
3. Look into the `output` directory.

Note: In order to generate &lt;title&gt; tags, input files are required to contain a &lt;h1&gt;.

## License
Licensed under GPLv2+ (in case it ever reaches the threshold of originality).
