# OlxProject

###Hi everyone
######This short description of my project.

Main task is to verify functional for olx.ua website.
To build web architecture I used **Page Object pattern**.
Also I developed some tests (_tests_ directory).
######These tests verify next functional:
- Searching items (success/unsuccess)
- Searching with delivery only
- Adding search result to _favorite_
- Pagination
- Registering on website
- Log in on website
- Sorting search result by price
- Changing currency
######Main gems I used in this case was:
- [rspec](https://github.com/rspec/rspec) (3.9.0).
- [selenium-webdriver](https://rubygems.org/gems/selenium-webdriver/versions/2.53.0) (3.142.6)
:+1:######To run tests open command line and run follow commands:###
```
cd /Users/.../Ruby_examples/OlxProject/tests
rspec spec test_name.rb
```
