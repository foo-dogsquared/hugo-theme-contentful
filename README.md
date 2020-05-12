# Contentful

Contentful is a Hugo theme mainly targeted for personal and one-man-show blogs that focuses on being contentful by having the most minimal format maintaining readability;
beautiful sane defaults while using modern web standards and features in this day and age.
It understands that not all use cases are possible with this theme so it also aims to be easy to extend and modify implementing the feature that you want.
Primarily tested on Chromium-based and Firefox-based web browsers.

It could also serve as a pretty introduction to Hugo themes since there not much going on.

Oh right, this also applies as my first practical application for reading [Practical Typography](https://practicaltypography.com/) by Matthew Butterick.
Let's see how this turns out.

Getting started with this theme is pretty easy.
All it needs is the `title` field from your site config.



## Feature list

The quickest way to describe Contentful in one go is a list.

The core feature of Contentful is to be easy to extend while providing sane and modern foundations, if you don't want to.
Here are the default features of the theme provides:

* Beautifully simple default layout while made to be easily modified and extensible.

* Provides a template for valid [RSS](https://cyber.harvard.edu/rss/rss.html), [Atom](https://tools.ietf.org/html/rfc4287), and [JSON](https://jsonfeed.org/) feeds.

* Dark mode toggle.

* Focus on web accessibility and search engine optimization (SEO) including [Twitter cards](https://dev.twitter.com/cards) and [Open Graph protocol](https://opengraphprotocol.org/).

* Google Analytics and Disqus integration.




## Installation

I assume you already have [Git](https://git-scm.com/) and [Hugo](https://gohugo.io/) installed.
For future reference, the minimum Hugo version required is at v0.58.
Additionally, the following instructions are done as if you're in a Hugo directory.

Installation of a Hugo theme is pretty simple, just clone the repo into your theme folder of your Hugo project.

```shell
git clone https://github.com/foo-dogsquared/hugo-theme-contentful.git themes/contentful
```

To try the theme out, just execute Hugo using the theme like in the following command.

```shell
hugo server --theme contentful
```

If you're decided to use this theme and don't want to bother using the `--theme` option, just set it in your [site configuration](https://gohugo.io/getting-started/configuration/) with the `theme` field and you're done!




## Configuration

The theme tries to use as little custom parameters as possible.
Thus, it would be pointless if I lay them all out since they're already explained from [the official documentation](https://gohugo.io/documentation/).
Instead, I decided to create an example configuration for you to explore.
The following example assumes you're using a TOML (`config.toml`).

```toml
baseURL = "https://example.com"
title = "Contentful"
theme = "contentful"
enableGitInfo = true
paginate = 20


[author]
    name = "John Doe"
    email = "johndoe@example.com"


[languages]
    [languages.en]
        # This key is used for more readable links to translated versions.
        languageName = "English"

    [languages.tl]
        languageName = "Tagalog"


[mediaTypes]
    [mediaTypes."application/atom+xml"]
        suffixes = ["atom"]

    [mediaTypes."application/rss+xml"]
        suffixes = ["rss"]


[outputFormats]
    [outputFormats.RSS]
        mediaType = "application/rss+xml"
        baseName = "index"

    [outputFormats.Atom]
        mediaType = "application/atom+xml"
        baseName = "index"


[outputs]
    home = ["HTML", "RSS", "ATOM", "JSON"]
    section = ["HTML", "RSS", "ATOM", "JSON"]


[menu]
    [[menu.main]]
        name = "About"
        url = "about/"

    [[menu.main]]
        name = "Categories"
        url = "categories/"

    [[menu.main]]
        name = "Tags"
        url = "tags/"


[params]
    # Enable table of content generation (only valid for Markdown files to be parsed by Hugo's built-in parsers).
    toc = true

    # Generate the feeds with the given number of most recent posts.
    feedLimit = true
```


### Custom site parameters

Contentful tries to use as little custom parameters as possible.
Here's the full list of the keys that the theme checks under `params` in the site configuration.

* `toc` accepts a boolean and if enabled, generates a table of contents for your posts (only works with Markdown files to be parsed under Hugo's builtin Markdown parser).

* `feedLimit` accepts an integer and simply limits the number of posts to be included in the web feeds.
This only works if certain [output formats](https://gohugo.io/templates/output-formats) are generated.
The RSS, Atom, and JSON feeds use this parameter.
If the key is unset or its value is less than 0, its go-to value is 10.

* `mainSections` is one of the common custom parameters in Hugo themes.
It accepts an array of string describing the folders (in the `content/` directory) to be included in list templates.
This lets you dictate contents that are visible in the HTML output and alternative output formats (such as web feeds).


### Custom parameters for pages

As for custom frontmatter fields for individual pages, Contentful checks the following keys aside from the default keys (e.g., `date`, `tags`, `categories`):

* `author` field accepts an array of dictionaries/objects simiar to the [site `author` field](https://gohugo.io/variables/site/#site-variables-list).
It could be handy for guest posts and co-authored papers with others.

* `hidden` (a boolean), if enabled, excludes the page from being included in [list templates](https://gohugo.io/templates/lists/) such as the homepage, categorial pages, and web feeds.

* `toc` field which only requires a boolean and overrides the global `toc` setting for that page.

* The `copyright` key, similar to the site config's `copyright`, is a plain-text string that gives information about the copyright (or copyleft) of the content.


### RSS, Atom, and JSON feeds

You can have web syndication formats like RSS and Atom by setting [custom output formats](https://gohugo.io/templates/output-formats) to your site configurations.
The theme mainly supports output feeds for the homepage and site sections.

I should point out that the web feeds prints the whole and links.

Here is an example configuration on enabling all of them.

```toml
# Visit the following for more information:
# https://gohugo.io/templates/output-formats

# Defining the media type of the output formats
# For JSON format, it doesn't need to be since it's already built-in into Hugo
[mediaTypes]
    [mediaTypes."application/atom+xml"]
        suffixes = ["atom", "atom.xml"] # You can remove the "atom.xml" if you want

    # Redefining RSS media type for the additional suffix
    [mediaTypes."application/rss+xml"]
        suffixes = ["rss", "rss.xml"] # You can remove the "rss.xml" if you want


# Including all of the feed output formats in the build
[outputFormats]
    [outputFormats.Rss]
        mediaType = "application/rss+xml"
        baseName = "index"

    [outputFormats.Atom]
        mediaType = "application/atom+xml"
        baseName = "index"


# Indicating what output formats shall be included
# for the following kinds
[outputs]
    # .Site.BaseURL/index.* is available
    home = ["HTML", "JSON", "RSS", "ATOM"]

    # .Site.BaseURL/$section/index.* is available
    section = ["HTML", "JSON", "RSS", "ATOM"]
```


### Multilingual mode support

[Multiple languages](https://gohugo.io/content-management/multilingual/) for your site is supported.
You can simply organize your content as described on [this blog post](https://regisphilibert.com/blog/2018/08/hugo-multilingual-part-1-managing-content-translation/).

The theme requires a language code based from [IANA Language Subtag Registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry) as defined from the [W3 documentation](https://www.w3.org/International/questions/qa-choosing-language-tags).

As of 2019-09-21, only English and Tagalog is supported.
Contributions through translations are appreciated.




## Modifying the theme

The theme was made to be easy to modify (thus extend).
But first, a preview of the core file structure of the project that you'll surely some attention in the future:

```shell
hugo-theme-contentful
├── content/
├── i18n/
├── layouts/
├── static/
├── CHANGELOG.adoc*
├── LICENSE*
└── README.md*
```

This is simply the [Hugo's directory structure](https://gohugo.io/getting-started/directory-structure/).
If you're already familiar with this, it shouldn't be a problem.

If you want to store CSS and JavaScript files, it is preferred to store them in `static/` folder.
To edit the site CSS, simply copy the stylesheet located in `theme/contentful/static/css/main.css` to your own static folder (with the same folder structure) and override it with your own modifications.
If your own modification has gone to an extent where maintaining a single CSS file is reminiscent of r

The next folder you most likely want to pay attention is the `layouts/` directory where all of the well, layouts are stored.
There are some things that are already figured out for you such as the templates for RSS, Atom, and JSON feeds.
You can easily add in your own, if you want.

Some things you may want to be customized are the [404 page](./layouts/404.html), [`<head>` for your own scripts](./layouts/partials/head.html), [header](./layouts/partials/header.html), and the [footer](./layouts/partials/footer.html).

Since Contentful does not provide all features by default, you have to implement it yourself ala-[Suckless tools](https://suckless.org/).
(Unlike Suckless tools, it's not as hard, I swear.)
Still, I've provided some recipes for some of the common features I've would added in most Hugo themes (though this is only specific to Contentful).
The following implementation assumes you have the example configuration given from the [configuration section](#configuration) and you're in your own Hugo directory with Contentful installed as a theme.

You can see more recipes for certain features like in the [official documentation](https://gohugo.io/), [its community forum](https://discourse.gohugo.io/), and [other third-party sites](http://hugocodex.org/add-ons/).
One of the most useful example that I won't be listing here is the [breadcrumbs implementation](https://gohugo.io/content-management/sections/#example-breadcrumb-navigation) from the official docs.


### Customizing your `<head>`

Let's start with the most basic and perhaps most useful customization: modifying the `<head`>.
This is useful for adding your own CSS and JavaScript files, changing certain metadata, or adding icons.

First, copy the `head` partial from the theme (`theme/contentful/layouts/partials/head.html`) to your own (`layouts/partials/head.html`).
We're simply taking advantage of [Hugo's lookup order](https://gohugo.io/templates/lookup-order/) where we've override the `head` partial with our own copy.

Then, feel free to add your own (or others') scripts and stylesheets, [icons and other metadata](https://developer.mozilla.org/en-US/docs/Learn/HTML/Introduction_to_HTML/The_head_metadata_in_HTML), or whatever suitable things.

In my case, I often use certain JavaScript libraries like [MathJax](https://www.mathjax.org/) for mathematical typesetting, [Prism](https://prismjs.com/) for syntax highlighting, and [medium-zoom](https://github.com/francoischalifour/medium-zoom/) for interactive image zooms.

Here's the modified code.
(The example code is snipped for brevity.)

```go
<!--snip-->

{{- /* MathJax */ -}}
<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script id="MathJax-script" defer src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"></script>

{{- /* Prism.js */ -}}
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/prism/1.20.0/themes/prism-tomorrow.min.css" type="text/css">
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.20.0/components/prism-core.min.js"></script>
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.20.0/plugins/autoloader/prism-autoloader.min.js">
<script defer src="https://cdnjs.cloudflare.com/ajax/libs/prism/1.20.0/plugins/keep-markup/prism-keep-markup.min.js">

{{- /* medium-zoom */ -}}
<script defer src="https://cdn.jsdelivr.net/npm/medium-zoom@1.0.5/dist/medium-zoom.min.js"></script>
<script>window.addEventListener('load', () => mediumZoom('article img', { 'background': 'rgba(0, 0, 0, 0.75)' }))</script>
```

Since most of the JavaScript libraries used here are not really a requirement (except for MathJax for mathematical typesetting), I've set them to be loaded at the end of the page loading with [`defer` attribute](https://developer.mozilla.org/en-US/docs/Web/HTML/Element/script).
If you have an inline script, you can simply wrap it in an event listener for page loading (`window.addEventListener("load", your_function_goes_here)`).

If you want document-specific libraries, you have to pass some raw HTML through the parser of the document.
For Goldmark, the default Markdown parser starting [Hugo v0.60.0](https://gohugo.io/news/0.60.0-relnotes/), blocks raw HTML by default and you can disable it by setting `markup.goldmark.renderer.unsafe` to `true`.

For Blackfriday, it parses even the raw HTML just fine.
Though, you have to set it as the default Markdown parser.

For [Asciidoctor](https://asciidoctor.org/), you can use [passthroughs](https://asciidoctor.org/docs/user-manual/#passthroughs) to get raw HTML through.


### Twitter cards

This will add [Twitter cards](https://developer.twitter.com/en/docs/tweets/optimize-with-cards/guides/getting-started) for your webpages.
(Be sure to copy the `head` partial first in your own layout folder.)

Thankfully, Hugo already has [an internal template for Twitter cards](https://gohugo.io/templates/internal/#twitter-cards).
Simply add  `{{- template "_internal/twitter_cards.html" . -}}` somewhere in your own copy.
(For reference, [here's the source code for the internal template](https://github.com/gohugoio/hugo/blob/25a6b33693992e8c6d9c35bc1e781ce3e2bca4be/tpl/tplimpl/embedded/templates/twitter_cards.html).)

You could also roll your own Twitter cards but I recommend to modify the internal template instead fitting your specific needs.
(Copy the internal template from the given link, create it as a partial in `layouts/partials/twitter_cards.html`, modify it, and insert the template with `{{- partial "twitter_cards.html" -}}`.)


### Open Graph protocol

Next up, we're implementing [Open Graph protocol](https://opengraphprotocol.org/) for our webpages.
Commonly used for making suitable format when sharing the content on certain sites like Facebook.
(Be sure to copy the `head` partial first in your own layout folder.)

Similar to Twitter cards, Hugo has [an internal template for this](https://gohugo.io/templates/internal/#open-graph).
Simply add  `{{- template "_internal/opengraph.html" . -}}` somewhere in your own copy.
(For reference, [here's the source code for the internal template](https://github.com/gohugoio/hugo/blob/25a6b33693992e8c6d9c35bc1e781ce3e2bca4be/tpl/tplimpl/embedded/templates/opengraph.html).)

If you want more control and customized version of the output, I recommend to copy the internal template and create a partial (e.g., `layouts/partials/opengraph.html`) and modify it.


### An archive page

This will add an archive page similar to archive pages [like](https://davidtranscend.com/archives/) [these](https://lukesmith.xyz/blogindex.html).

```go
{{- define "main" -}}

<h1>{{ .Title }}</h1>

{{ .Content }}

<hr>

{{- /* Creating a section that lists out regular pages by year */ -}}
{{ range $.Site.RegularPages.GroupByPublishDate "2006" }}
    {{- /* Skip regular pages with an invalid creation date string. */ -}}
    {{- /* This is convenient if we want to exclude certain posts to be listed by giving no value to `date` in the frontmatter. */ -}}
    {{- /* We will also exclude hidden pages. */ -}}
    {{ if ne .Key "0001" }}
        <section data-year="{{ .Key }}">
            <h2 id="{{ .Key }}">{{ .Key }}</h2> 
            <ul>
            {{- range where .Pages "Params.hidden" "!=" true -}}
                <li>
                    <date>{{ .Date.Format "2006-01-02" }}</date> -
                    <a aria-label="{{ .Title }}" href="{{ .Permalink }}">{{ .Title }}</a>
                </li>
            {{- end -}}
            </ul>
        </section>
    {{- end }}
{{ end }}

{{- end -}}
```

We will simply add this as a layout in our customized theme.
Let's call it `archives` so we have to add a file in `layouts/_default/archives.html` then set a page of our project with the `layout` key in the frontmatter.

We want the archives page to be accessed at `$.Site.BaseURL/archives` so we'll simply create `archives.adoc` ([any valid content files with certain file extensions can do](https://gohugo.io/content-management/formats/#list-of-content-formats), I'm using [Asciidoctor](https://asciidoctor.org/)) with the following example content.

```asciidoctor
---
title: "Archives"
layout: "archive"
---

= Archives

This is the archives of the century.
```


### Configurable social media links

Most themes offer quick social media links with site configuration.
However, it is only limited to popular media sites such as Facebook, Twitter, Instagram, GitHub, etc.

To get around this, we'll make use of [data templates](https://gohugo.io/templates/data-templates/).
Let's create a quick game plan how does it work.

The data is a top-level dictionary/object with each key contains an object with the following fields.

* `url` is the... contact link itself and it is required to have it.

* `name` is the text to appear in the output.
Also required to have.

* `weight` is an integer similar to how Hugo sorts the pages with the lower weight having high precedence;
if this key is absent, it will be interpreted as 0.

And here's the data example in TOML which is placed in `data/contact.toml`.

```toml
[github]
    name = "GitHub"
    url = "https://github.com/foo-dogsquared"

[gitlab]
    name = "Gitlab"
    url = "https://gitlab.com/foo-dogsquared"

[keybase]
    name = "Keybase"
    url = "https://keybase.io/foo_dogsquared"
    weight = -1

[twitter]
    name = "Twitter"
    url = "https://twitter.com/foo_dogsquared"
```

I want my Keybase profile to appear first than anything else for whatever reason so the `weight` key is set to -1.

With this data, we can then create a template out of it.
I've put the following template in a partial named `contacts` (i.e., `layouts/partials/contacts`).

```go
<address>
{{- range (sort $.Site.Data.contact "weight" "asc") -}}
| <a rel="me" href="{{ .url }}">{{- .name -}}</a> |
{{- end -}}
</address>
```

A suggestion (and an exercise) for extending this is to create image links.
Maybe add another key named `image` that accepts either URL.



## Inspirations

This theme is inspired by the following beautiful and minimal pieces of work:

* [The Best Motherfucking Website](https://thebestmotherfucking.website/)
* [Jeff Kreeftmeijer's site](https://jeffkreeftmeijer.com/)
* [Hugo XMin](https://github.com/yihui/hugo-xmin)
* [ratfactor.com](https://ratfactor.com/)
* [Arch Terminal](https://github.com/foo-dogsquared/hugo-theme-arch-terminal) (OK, I think this is just selling out; this is my first theme, btw)




## License

This theme is licensed under MIT license.
Please see the original license file for more details.

