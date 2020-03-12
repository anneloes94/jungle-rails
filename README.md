# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example. 

Jungle's home page displays products which a user can add to their cart and pay for (using the paying platform Stripe). A user can register, login, visit the about page and filter products based on a selected category. 

An admin has to use HTTP basic authentication to access two admin sections: 1) viewing and adding new products, and 2) a dashboard displaying the current amount of products and categories in the e-commerce app.

## Walkthrough

![The home page, displaying products](#hello)

![A user can view their cart](#hello)

![An admin can add a new product to the webshop](#hello)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
