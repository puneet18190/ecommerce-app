### ECommerce App

Its a Ruby on Rails application based on E-Commerce App.


## Instructions for Local Setup

* Clone the Repository
```
    git clone https://github.com/puneet18190/ecommerce-app.git
    cd ecommerce-app
```

* Install the dependencies.
```
    bundle install
```

Copy the .env.example file to .env, and edit it including your credentials.


* Create database and run migrations.
 
```
    bundle exec rake db:setup
```

* Start the server
```
    rails s
```

* Admin credentials: admin@gmail.com/12345678