---
title: Software
layout: default
group: software
---

## Software

Below is a collection of software tools developed, maintained, or used by our group.

{% for item in site.data.software %}
- **{{ item.name }}**  
  {{ item.description }}

  {% if item.link %}
  <a href="{{ item.link }}" target="_blank">GitHub Repository →</a>
  {% endif %}

{% endfor %}
