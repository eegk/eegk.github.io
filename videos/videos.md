---
layout: page
title: "Videos"
permalink: /videos/
---

<h1>Videos</h1>

<ul class="video-list">
{% for video in site.data.videos %}
  <li>
    <h3>{{ video.title }}</h3>
    <p>{{ video.description }}</p>
    <iframe width="560" height="315"
            src="https://www.youtube.com/embed/{{ video.youtube_id }}"
            frameborder="0" allowfullscreen>
    </iframe>
  </li>
{% endfor %}
</ul>
