My Blog
========

My implementation of the http://guides.rubyonrails.org/ tutorial to build a blog site using Rails. The most notable change in my version is that the main landing page ('/') displays the latest blog post, if there are no posts yet a page will be displayed advising the user to check back again.

Deployment:
===========

- Ruby version - 2.3.3
- Rails version - 5.1.2

Change login credentials in:

articles_controller.rb
tags_controller.rb

to something more secure
