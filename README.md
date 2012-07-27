# HN Clone 

HN Clone replicates much of the functionality of [news.ycombinator.com](http://news.ycombinator.com) allowing users to post links, comment on links, comment on comments, and vote on comments/links that are not theirs.

Run
---------

To run HN Clone locally at localhost:3000, simply enter the following in your bash shell:

```shell
git clone https://github.com/Pcushing/HN_Clone.git
bundle install
rake db:migrate
rails s
```

Demo
---------

Check out our working demo of [HN Clone](http://polar-river-9481.herokuapp.com/).

Todo
---------

* Provide numbering on the list of links
* Update ordering of links and comments based on a combination of votes, time since posting, etc.
* Provide explicit error messages for validation errors
* Improve loading various resources via AJAX instead of explicit refreshes
* Allow users to retrieve passwords, edit their credentials

License
-------

HN Clone is a side project and totally free.  Enjoy. 