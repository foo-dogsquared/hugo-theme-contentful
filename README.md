# Contentful

It's a Hugo theme that focuses on being contentful by having the most 
minimal format as much as possible while being readable. 
That said, it is easy to extend and modify to implement the feature that 
you want. 

It could also serve as a pretty introduction to Hugo themes since there 
not much going on. 

Getting started with this theme is pretty easy. 
All it needs is the `title` field from your site config. 

The base theme could also render menu entries (but nested menus are not supported). 

## Inlining CSS 

You can make the CSS to be inline instead by moving the CSS stylesheet in the assets 
folder and edit the appropriate file. 

As of 2019-09-11, this stylesheet is located in `static/css/main.css` so it should be 
easy to override it with your own modifications. 

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

Multiple languages for your site is supported. 
You can simply organize your content as discussed on [this blog post](https://regisphilibert.com/blog/2018/08/hugo-multilingual-part-1-managing-content-translation/). 

The theme requires a language code based from [IANA Language Subtag Registry](https://www.iana.org/assignments/language-subtag-registry/language-subtag-registry) as defined from the [W3 documentation](https://www.w3.org/International/questions/qa-choosing-language-tags). 

As of 2019-09-21, only English and Tagalog is supported. 
Contributions through translations are appreciated. 

## Inspirations

This theme is inspired by the following beautiful and minimal pieces of work:

* [Jeff Kreeftmeijer's site](https://jeffkreeftmeijer.com/)
* [Hugo XMin](https://github.com/yihui/hugo-xmin) 
* [ratfactor.com](https://ratfactor.com/)
* [Arch Terminal](https://github.com/foo-dogsquared/hugo-theme-arch-terminal) (OK, I think this is just selling out; this is my first theme, btw) 

## License 

This theme is licensed under MIT license. 
Please see the original license file for more details. 
