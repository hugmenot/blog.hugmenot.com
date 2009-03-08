---
layout: default
title: blog.hugmenot.com
---
{% for post in site.posts %}
  <div class="section
              clearfix
              {% if forloop.first %} first {% endif %}
              {% if forloop.index0 < 3 %}
                 full
              {% else %}
                 {% if forloop.index0 < 6 %}
                    preview
                 {% else %}
                    title-only
                 {% endif %}
              {% endif %}
             ">
    <h1><a href="{{ post.url }}" {% if forloop.first %} name="current" {% endif %}>{{ post.title }}</a></h1>
    <div class="time">{{ post.date | date_to_string }}</div>
    {% if forloop.index0 < 3 %}
      {{ post.content }}
    {% else %}
      {% if forloop.index0 < 6 %}
        {{ post.content | first_paragraph }}
        <h2><a href="{{ post.url }}">Read full article</a></h2>
      {% endif %}
    {% endif %}
  </div>
{% endfor %}
