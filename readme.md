# _Recipe Box_
## By Katarina Tuttle

##### Recipe Box with ActiveRecord

## User Stories

* As a user, I want to add a recipe with ingredients and instructions, so I remember how to prepare my favorite dishes.
* As a user, I want to tag my recipes with different categories, so recipes are easier to find. A recipe can have many tags and a tag can have many recipes.
* As a user, I want to be able to update and delete tags, so I can have flexibility with how I categorize recipes.
* As a user, I want to edit my recipes, so I can make improvements or corrections to my recipes. 
* As a user, I want to be able to delete recipes I don't like or use, so I don't have to see them as choices. 
* As a user, I want to rate my recipes, so I know which ones are the best.
* As a user, I want to list my recipes by highest rated so I can see which ones I like the best.
* As a user, I want to see all recipes that use a certain ingredient, so I can more easily find recipes for the ingredients I have.

## Technologies Used

Application: Ruby, Sinatra, Active Record<br>
Testing: Rspec, Capybara<br>
Database: Postgres

Installation
------------

```
$ git clone https://github.com/KKTuttle/R_recipe_box
```

Install required gems:
```
$ bundle install
```

Create databases:
```
rake db:create
rake db:schema:load
```

Start the webserver:
```
$ ruby app.rb
```

Navigate to `localhost:4567` in browser.

## Contact

Email: katka.karolcikova@gmail.com

License
-------

GNU GPL v2. Copyright 2015 **Katarina Tuttle**
