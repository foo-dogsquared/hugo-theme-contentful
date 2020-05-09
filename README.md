# Contentful

It's a Hugo theme that focuses on being contentful by having the most minimal format as much as possible maintaining readability and easy on the eyes, using modern web standards and features in this day and age.
It also aims to be easy to extend and modify to implement the feature that you want.
Primarily tested on Chromium-based and Firefox-based web browsers.

It could also serve as a pretty introduction to Hugo themes since there not much going on.

Getting started with this theme is pretty easy.
All it needs is the `title` field from your site config.




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

If you're decided to use this theme and don't want to bother using the `--theme` option, just set it in your [site configuration](https://gohugo.io/getting-started/configuration/) and you're done!




## Configuration

The theme tries to use as little custom parameters as possible.
Thus, it would be pointless if I lay them all out since they're already explained from [the official documentation](https://gohugo.io/documentation/). 
Instead, I decided to create an example configuration for you to explore.
The following example assumes you're using a TOML (`config.toml`).

```toml
baseURL = "https://example.com"
title = "Contentful"
enableGitInfo = true
paginate = 20


[languages]
    [languages.en]
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
```

As for custom frontmatter for individual pages, Contentful checks the following keys:

* `author` field based from the [site `author` field](https://gohugo.io/variables/site/#site-variables-list).
It could be handy for guest posts and co-authored papers with others.

* `toc` field which only requires a boolean and overrides the global `toc` setting for that page.

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




## RSS, Atom, and JSON feeds

You can have web syndication formats like RSS and Atom by setting [custom output formats](https://gohugo.io/templates/output-formats) to your site configurations.
The theme supports output feeds for the homepage and site sections.

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




## Multilingual mode support

[Multiple languages](https://gohugo.io/content-management/multilingual/) for your site is supported.
You can simply organize your content as described on [this blog post](https://regisphilibert.com/blog/2018/08/hugo-multilingual-part-1-managing-content-translation/).

The theme requires a language code based from [IANA Language Subtag Registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry) as defined from the [W3 documentation](https://www.w3.org/International/questions/qa-choosing-language-tags).

As of 2019-09-21, only English and Tagalog is supported.
Contributions through translations are appreciated.




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
