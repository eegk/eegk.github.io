---
title: Software
layout: default
group: software
---

# Software

Below is a collection of software tools developed, maintained, or used by our group.

{% for item in site.data.software %}
## {{ item.name }}{% if item.language %} <small>({{ item.language }})</small>{% endif %}

{{ item.description | markdownify }}

{% if item.link %}
[GitHub Repository]({{ item.link }}){% endif %}

---
{% endfor %}
