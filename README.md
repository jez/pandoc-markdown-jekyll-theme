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
# Install the Jekyll theme
bundle install
# Copy out one file that has to live in the site folder, not the theme
cp $(bundle info pandoc-markdown-jekyll-theme --path)/_template.html5 .
# Bust the Jekyll cache (Jekyll doesn't track _template.html5 changes)
rm -rf .jekyll-cache
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
    - M: 'site__baseurl=/'
```

If your Jekyll site has a `baseurl:` setting in `_config.yml`, change the last
line above to `site__baseurl=$BASEURL/`, replacing `$BASEURL` with what the
setting of your `baseurl` property reads. (There is unfortunately no easy way to
get the Pandoc template file to read from the Jekyll config, so the value must
be duplicated.)

## Usage

The following variables are used by this theme.

- `site.title`
  - Only shows up as suffix in `<title>` element
- `page.title`
- `site.author`
- `page.author`
- `page.author_url`
- `site.baseurl`
  - Make sure you don't have a trailing slash here
- `site.header_includes`
- `page.header_includes`
  - You can use these to include raw HTML in the `<head>`
- `site.include_after`
- `site.pandoc_markdown_skip_syntax_theme`
  - Set to `true` to skip including the default syntax theme CSS file.
- `page.include_after`
  - You can use these to include raw HTML in the `<body>` before the content
- `site.include_before`
- `page.include_before`
  - You can use these to include raw HTML in the `<body>` after the content
- `page.layout`
  - Pick one of `index`, `page`, or `post`
  - `index` won't have a "Return home" link at the bottom of the page
- `page.subtitle`
  - Shows up in the page.
- `site.description`
- `page.description`
  - Only shows up in the `<head>` section, as a `<meta>` tag.
- `page.date`
- `page.keywords`
- `page.math`
  - If `true`, we'll include KaTeX for displaying math formulas. Will add
    JavaScript on this page.
- `page.lang`
  - Sets the HTML lang attribute. Default: `'en'`
- `page.dir`
  - Sets the HTML dir attribute. Default: `'ltr'`

You can also define:

- `_includes/enable_checkboxes.html`

to be an empty file in your project to remove the only non-math JavaScript.

## Developing

To update KaTeX:

```bash
katex_version=0.11.1
mkdir assets/libs/KaTeX/$katex_version/
cd assets/libs/KaTeX/$katex_version/
wget https://cdnjs.cloudflare.com/ajax/libs/KaTeX/$katex_version/katex.min.js
wget https://cdnjs.cloudflare.com/ajax/libs/KaTeX/$katex_version/katex.min.css
rg --no-heading --no-filename --no-line-number --only-matching 'url\(font[^)]+\)' | \
  cut -c 5- | \
  sed -e 's/)$//' | \
  sed -e "s+^+https://cdnjs.cloudflare.com/ajax/libs/KaTeX/$katex_version/+" | \
  xargs wget -i -
mkdir -p fonts
mv *.ttf *.woff *.woff2 fonts
```

To make a release:

```bash
version=TODO
vim pandoc-markdown-jekyll-theme.gemspec
git commit pandoc-markdown-jekyll-theme.gemspec -m "$version"
git tag "$version"
git push --tags origin master
gem build pandoc-markdown-jekyll-theme.gemspec
gem push "pandoc-markdown-jekyll-theme-$version.gem"
```
