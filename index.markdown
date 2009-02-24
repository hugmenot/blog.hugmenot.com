---
layout: default
title: blog.hugmenot.com
---

This project <a href="http://blog.hugmenot.com">blog.hugmenot.com</a> is awesome.

To enable Disqus comments + badges for this site, [add it to your Disqus account](http://disqus.com/add/).

<ul class="posts">
  {% for post in site.posts %}
    <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>