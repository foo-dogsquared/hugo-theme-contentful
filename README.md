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




## Demo

There's a demo available at the `demo` branch with the live version at https://foo-dogsquared.github.io/hugo-theme-contentful/.
It features a multilingual site with the default settings and a dedicated section to recipes for extending this theme.




## Feature list

The quickest way to describe Contentful in one go is a list.

The core feature of Contentful is to be easy to extend while providing sane and modern foundations, if you don't want to.
Here are the default features of the theme provides:

* Beautiful reader-mode default layout.
* Dark mode toggle.
* Focus on web accessibility and search engine optimization (SEO) including [Twitter cards](https://dev.twitter.com/cards) and [Open Graph protocol](https://opengraphprotocol.org/).
* Google Analytics and Disqus integration.
* Web accessible-ready by following the standard practices as referred to by the [W3C](https://www.w3.org/TR/wai-aria-1.1/).

As previously mentioned, this theme is made to be easily extensible.
With some integration with the huge ecosystem of Hugo, you can make the theme feature the following highlights.

* Deploy with web feeds with [a Hugo module I made that adds them](https://github.com/foo-dogsquared/hugo-web-feeds).
* Make more modern with [a theme extension](https://github.com/foo-dogsquared/hugo-mod-more-contentful).

More possibilities are there if you tinker it with your own modifications.




## Installation

I assume you already have [Git](https://git-scm.com/) and [Hugo](https://gohugo.io/) installed.
For future reference, the minimum Hugo version required is at v0.74.
Furthermore, the following instructions are done as if you're in a Hugo directory.

You can install the Hugo theme in two ways.


### Using Hugo module

You can quickly add this theme as a [Hugo module](https://gohugo.io/hugo-modules/).
It does have a prerequisite of using Hugo v0.56.0 and above as well as a [Go runtime](https://golang.org/).

To get started, initialize your Hugo project as a Hugo module.

```shell
hugo mod init $HUGO_MODULE_NAME
```

Add the theme as a Hugo module by adding the appropriate setting in your site configuration.
The below snippet immediately adds the theme and set the module as your theme immediately (assuming it's in TOML format).

```toml
[module]
  [[module.imports]]
    path = "github.com/foo-dogsquared/hugo-theme-contentful"
```

Then run `hugo mod get` or a Hugo server (i.e., `hugo serve`) to get the dependency.
For updating the module, run `hugo mod get -u`.

Using this option also provides a convenient option to specify the version of the theme with a single change.
You can specify the version by just adding a tag to the path (e.g., `github.com/foo-dogsquared/hugo-theme-contentful@1.0.0`) or a commit (e.g., `github.com/foo-dogsquared/hugo-theme-contentful@2fbf28b`).
For more information, see [how to specify Go modules](https://github.com/golang/go/wiki/Modules#how-to-upgrade-and-downgrade-dependencies) since Hugo modules are built on top of it.

Additionally, you can vendor the theme project with `hugo mod vendor` if you intend to fully modify the project.
See the [related section](https://gohugo.io/hugo-modules/use-modules/#vendor-your-modules) for more information.


### The theme folder

This simply involves copying the project into the theme folder (i.e., `themes/`).
You can simply download the project either with the GitHub archive export.
Since it is hosted on a Git repo, you can simply clone it like the following command.

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
The following example assumes you're using a TOML file for your configuration (`config.toml`) and installing the theme with Hugo modules.

```toml
baseURL = "https://example.com"
title = "Contentful"
enableGitInfo = true
paginate = 20


[module]
  [[module.imports]]
    path = "github.com/foo-dogsquared/hugo-theme-contentful"
  [[module.imports]]
    path = "github.com/foo-dogsquared/hugo-web-feeds"


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




## Inspirations

This theme is inspired by the following beautiful and minimal pieces of work:

* [The Best Motherfucking Website](https://thebestmotherfucking.website/)
* [Jeff Kreeftmeijer's site](https://jeffkreeftmeijer.com/)
* [Hugo XMin](https://github.com/yihui/hugo-xmin)
* [ratfactor.com](https://ratfactor.com/)
* [Arch Terminal](https://github.com/foo-dogsquared/hugo-theme-arch-terminal) (OK, I think this is just selling out; this is my first theme, btw)




## License

This theme is licensed under MIT license.
Please see the original [license file](./LICENSE) for more details.

