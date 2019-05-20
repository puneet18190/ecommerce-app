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
* Customer credentials: puneetgupta18190@gmail.com/123456

## Features
* User signup/signin by devise
* Admin and user roles
* Image upload by carrierwave
* Searching by Solr
* Two factor authentication by Twilio
* Admin can create category and products.
* User can add products to carts and make payment
* Otp send to mobile for order confirmation
* After confirm order, confirmation mail send to user email
* User can add, update or delete products in cart
* User can check their orders
* Admin can check all users orders

## Database Architechure
### Following are the tables:
* User : Two types of users ie admin and customers
* Category: Admin can create muliple categories and customer can only see the categories
* Product: Admin can add products in category and customer can only add products in cart
* Order: Customer can create order after confirmation of payment by verification of twilio otp.
* OrderItem: Customer can add order in cart which save in order item table.




