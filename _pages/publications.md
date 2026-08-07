---
layout: archive
title: "Publications"
permalink: /publications/
author_profile: true
excerpt: "Research publications by Zheyuan LI in computer vision, image restoration, image quality assessment, and generative modeling."
---

<p class="report-eyebrow">Research archive · 2022—present</p>
<p class="report-section__intro">Peer-reviewed work across image restoration and enhancement, vision-language image quality understanding, efficient architectures, model interpretation, and controllable generation.</p>

<div class="publication-list publication-index">
  {% assign sorted_publications = site.publications | sort: "date" | reverse %}
  {% for post in sorted_publications %}
    {% include publication-card.html post=post %}
  {% endfor %}
</div>
