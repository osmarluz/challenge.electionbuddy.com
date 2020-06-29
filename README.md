# ElectionBuddy's Coding Challenge

![ruby](https://img.shields.io/badge/Ruby-2.6.1-green.svg)
![rails](https://img.shields.io/badge/Rails-6.0.3.1-green.svg)

The project was developed using **Docker** and **docker-compose**, so the instructions below are assuming you have both installed on your machine.
I've also changed the database from SQLite to Postgres, as I have more knowledge handling Docker with Postgres.
I hope this is ok, it was a lot easier than installing everything separately. =D

## Running the tests

### 1. Build the containers

`docker-compose build`

### 2. Create the test database and run the migrations on the container

`docker-compose run --rm app bundle exec rails db:setup RAILS_ENV=test`

### 3. Run all the tests (except system tests)

`docker-compose run --rm app bundle exec rake test`

### 4. Run all system tests

`docker-compose run --rm app bundle exec rake test:system`

## Running the project

### 1. Build the containers (if this hasn't been done before)

`docker-compose build`

### 2. Create the development database and run the migrations on the container

`docker-compose run --rm app bundle exec rails db:setup RAILS_ENV=development`

### 3. Start the containers

`docker-compose up`