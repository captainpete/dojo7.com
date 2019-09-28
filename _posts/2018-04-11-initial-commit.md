---
layout: post
title:  "initial commit"
---
New website for dojo7.com, woooo!

Rather than have some carry-on about how this website is going to be awesome, here's a practical tip.

### The initial commit

When creating a new git repository, include an empty initial commit.
This helps in several circumstances:

- you want a from-scratch branch but want to keep the same root
- you want to remove secrets from git history that have been there since first adding content
- you want to do the above while avoiding multi-root repositories

This is as easy as

{% highlight bash %}
git commit -m "initial commit" --allow-empty
{% endhighlight %}

See the result in the initial commit of the [source powering this website](https://github.com/captainpete/dojo7.com/commit/f9556cd4d19c03cea8b51fde18a390038f14e225).

