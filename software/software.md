---
title: Software
layout: default
group: software
---

# Software

Below is a collection of software tools developed, maintained, or used by our group.

{% raw %}
<ul class="software-list">
{% for item in site.data.software %}
  <li class="software-item">
    <h3>{{ item.name }}</h3>
    <p>{{ item.description }}</p>
    {% if item.link %}
      <p><a href="{{ item.link }}" target="_blank">GitHub Repository →</a></p>
    {% endif %}
  </li>
{% endfor %}
</ul>
{% endraw %}
