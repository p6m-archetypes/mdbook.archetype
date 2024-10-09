# {{ project-title }}

[Rendered Book]({% if rendered-url %}{{ rendered-url }}{% else %}"<ADD URL>"{% endif %})

This book is authored using `mdbook`, a tool for writing books in Markdown.

## Requirements
To build this book locally, you will need to have the following installed:
* mdbook (`cargo install mdbook`){% if "TOC" in features %}
* mdbook-toc (`cargo install mdbook-toc`){% endif %}{% if "Admonish" in features %}
* mdbook-admonish (`cargo install mdbook-admonish`){% endif %}{% if "MermaidJS" in features %}
* mdbook-mermaid (`cargo install mdbook-mermaid`){% endif %}

To have this book publish to Github Pages automatically, you will need to set the following in your repository:

Settings > Pages > Source: Github Actions

## Build
```mdbook build```

## Development
```mdbook serve -o```