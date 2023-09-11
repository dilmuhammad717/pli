# README
* Ruby version is 3.1.2
* Rails version is 7

I followed the steps below.

* Created new application using command

rails new pli --database=mysql --skip-webpack-install --skip-javascript

* Add the required gems
* rails tailwindcss:install
* Configure database.yml
* rails db:create
* rails generate rspec:install
* delete test directory
* rails importmap:install
* rails stimulus:install

* Scaffold the person model with mentioned attributes
* Removed unnecessary code

* Setup attribute accessor and implement validation
* Compiled data to save in database

* Modified people_controller actions
* Modified views for layout
* created partials
* Added stimulus controller for frontend validation

* Added Employment model, validation, association with person
* Implemented "Add Employment functionality"
* Save data
* Implemented index page to view saved data
* Added eager to handle N+1 query issue
* Added test cases for models, helpers, requests, routing, and views

* Updated seed.rb file
* Used Faker to insert data for seed.rb 