# pandoc-markdown-jekyll-theme

This is a Jekyll theme for blogging with Pandoc. It's based off of [Pandoc
Markdown CSS Theme] for the original CSS file. Read more about the theme there.

[Pandoc Markdown CSS Theme]: https://jez.io/pandoc-markdown-css-theme/

## Installation

There are two external dependencies in order to use this theme:

- [Pandoc](https://pandoc.org/)
- [`pandoc-sidenote`](https://github.com/jez/pandoc-sidenote)

Follow the installation instructions for your platform. If you’re using macOS,
installation is as easy as:

```bash
brew install pandoc
brew install jez/formulae/pandoc-sidenote
```

Next, add this line to your Jekyll site's Gemfile:

```ruby
# -- Gemfile --
# ...

gem "pandoc-markdown-jekyll-theme"
```

And then run:

```bash
bundle install
```

And finally, update your `_config.yml` file:

```yaml
# -- _config.yml --

theme: pandoc-markdown-jekyll-theme

gems:
  - jekyll-pandoc

markdown: Pandoc

pandoc:
  extensions:
    - from: 'markdown+smart+tex_math_single_backslash'
    - filter: 'pandoc-sidenote'
    - template: '_template'
    - katex
    - toc
```

## Usage

The following variables are used by this theme.

- `site.title`
- `site.author`
  - Note that this theme currently only supports one author.
- `site.baseurl`
  - Make sure you don't have a trailing slash here
- `site.header_includes`
- `page.header_includes`
  - You can use these to include raw HTML in the `<head>`
- `site.include_after`
- `page.include_after`
  - You can use these to include raw HTML in the `<body>` before the content
- `site.include_before`
- `page.include_before`
  - You can use these to include raw HTML in the `<body>` after the content
- `page.layout`
  - Pick one of `index`, `page`, or `post`
  - `index` won't have a "Return home" link at the bottom of the page
- `page.title`
- `page.subtitle`
- `page.date`
- `page.keywords`
- `page.math`
  - If `true`, we'll include KaTeX for displaying math formulas
- `pandoc_markdown_syntax_theme`
  - Defaults to `'solarized'`. Set to `false` to provide your own theme.

## Developing

To make a release:

```bash
vim pandoc-markdown-jekyll-theme.gemspec
git commit pandoc-markdown-jekyll-theme.gemspec -m 'Bump version'
git tag "$version"
git push --tags origin master
gem build pandoc-markdown-jekyll-theme.gemspec
gem push "pandoc-markdown-jekyll-theme-$version.gem"
```
