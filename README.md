# Jungle

**Welcome to (the) Jungle**! A mini e-commerce application built using Ruby with Rails 6.1. Jungle allows you to view a list of products, add them to your cart, and simulate checkout/purchase functionality using Stripe. Users can conveniently browse through products by category, and even click on individual products to view a more detailed description.

Those with proper admin credentials have access to a dashboard containing details about certain metrics of the application. Admins can also perform CRUD operations on store categories, products, and sales promotions.

Follow the instructions below to get started!

**DISCLAIMER**: This application has no affiliation with the band _Guns N' Roses_, despite the hilarious reference above. There will be absolutely no access to guns, and any mention of roses is purely coincidental.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe

## Screenshots

!["Home Page"](https://github.com/CodyHilborn/jungle/blob/master/docs/Screen%20Shot%202023-03-15%20at%204.39.14%20PM.png?raw=true)
!["Admin Products Page"](https://github.com/CodyHilborn/jungle/blob/master/docs/Screen%20Shot%202023-03-15%20at%204.39.34%20PM.png?raw=true)
!["Fulfilled Order Page"](https://github.com/CodyHilborn/jungle/blob/master/docs/Screen%20Shot%202023-03-15%20at%204.40.43%20PM.png?raw=true)
