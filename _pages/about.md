---
layout: home
permalink: /
title: "Zheyuan LI"
excerpt: "Computer vision researcher working on image restoration, visual quality understanding, and generative models."
author_profile: false
redirect_from:
  - /about/
  - /about.html
---

{% assign home = site.data.home %}

<section class="report-section" id="research" aria-labelledby="research-title">
  <header class="report-section__header">
    <p class="report-section__kicker">{{ home.research.kicker }}</p>
    <div>
      <h2 class="report-section__title" id="research-title">{{ home.research.title }}</h2>
      <p class="report-section__intro">{{ home.research.intro }}</p>
    </div>
  </header>

  <div class="research-grid">
    {% for item in home.research.items %}
    <article class="research-card">
      <span class="research-card__index">{{ item.index }}</span>
      <h3>{{ item.title }}</h3>
      <p>{{ item.description }}</p>
    </article>
    {% endfor %}
  </div>
</section>

<section class="report-section report-section--paper" id="publications" aria-labelledby="publications-title">
  <header class="report-section__header">
    <p class="report-section__kicker">{{ home.publications.kicker }}</p>
    <div>
      <h2 class="report-section__title" id="publications-title">{{ home.publications.title }}</h2>
      <p class="report-section__intro">{{ home.publications.intro }}</p>
    </div>
  </header>

  <div class="publication-list">
    {% assign recent_publications = site.publications | sort: "date" | reverse %}
    {% assign publication_limit = home.publications.visible_count | default: 6 %}
    {% for post in recent_publications limit: publication_limit %}
      {% include publication-card.html post=post %}
    {% endfor %}
  </div>

  <div class="report-actions">
    <a class="report-button" href="{{ base_path }}/publications/">{{ home.publications.all_button }}</a>
  </div>
</section>

<section class="report-section" id="biography" aria-labelledby="biography-title">
  <header class="report-section__header">
    <p class="report-section__kicker">{{ home.biography.kicker }}</p>
    <div>
      <h2 class="report-section__title" id="biography-title">{{ home.biography.title }}</h2>
    </div>
  </header>

  <div class="biography-grid">
    <p class="biography-grid__lead">{{ home.biography.lead }}</p>
    <div class="biography-grid__body">
      {% for paragraph in home.biography.paragraphs %}
        <p>{{ paragraph }}</p>
      {% endfor %}
    </div>
  </div>

  <ul class="timeline" aria-label="Education and research timeline">
    {% for item in home.biography.timeline %}
    <li>
      <time>{{ item.period }}</time>
      <div><strong>{{ item.title }}</strong><span>{{ item.place }}</span></div>
    </li>
    {% endfor %}
  </ul>
</section>

<section class="report-section report-section--paper" id="news" aria-labelledby="news-title">
  <header class="report-section__header">
    <p class="report-section__kicker">{{ home.news.kicker }}</p>
    <div>
      <h2 class="report-section__title" id="news-title">{{ home.news.title }}</h2>
    </div>
  </header>

  <ul class="news-list">
    {% for item in home.news.items %}
    <li>
      <time datetime="{{ item.datetime }}">{{ item.date }}</time>
      <p>{{ item.text }}</p>
    </li>
    {% endfor %}
  </ul>
</section>
