# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Jekyll-based academic personal website built on the [academicpages](https://academicpages.github.io/) template (forked from Minimal Mistakes). It is hosted on GitHub Pages at `xiaom233.github.io`.

A PDF copy of each publication goes in `files/`.

## Local Development

```bash
bundle install                    # Install Ruby dependencies
bundle exec jekyll serve          # Start dev server at localhost:4000
bundle exec jekyll liveserve      # Start with live reload (requires hawkins gem)
```

## Content Structure

All content is authored as markdown files with YAML frontmatter.

| Directory | Purpose | Key frontmatter fields |
|-----------|---------|----------------------|
| `_pages/` | Core site pages (about, publications, cv, talks, etc.) | `permalink`, `title` |
| `_publications/` | Individual publication entries, one `.md` per paper | `title`, `date`, `venue`, `paperurl`, `excerpt`, `citation` |
| `_portfolio/` | Portfolio/life entries | `title`, `date` |
| `_talks/` | Talk entries | `title`, `date` |
| `_teaching/` | Teaching entries | `title`, `date` |
| `_posts/` | Blog posts | `title`, `date` |

## Publication File Convention

Publication filenames follow the pattern `YYYY-MM-DD-[slug].md`, matched by the `permalink: /publication/YYYY-MM-DD-[slug]`. The `date` field in frontmatter should match the filename date.

Publication PDFs are placed in `files/` and served at `/files/[filename].pdf`.

## Site Configuration

- `_config.yml` — Site-wide settings: author info, collections, navigation, plugins
- `_data/navigation.yml` — Top navigation bar links
- `.gitignore` — Excludes `_site/` and `.idea/`

## Bulk Generation

`markdown_generator/publications.py` can generate publication markdown files in bulk from a TSV file (`publications.tsv`) with columns: `pub_date`, `title`, `venue`, `excerpt`, `citation`, `site_url`, `paper_url`, `url_slug`.
