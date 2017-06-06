# GymBull

GymBull is a community of fitness dedicated to sharing workout and nutrition information from around the world. It was developmet and is presetnly maintained and administred by [Ethan T. Schmidt](http://www.ethantschmidt.com)

## Installation prerequisites

GymBull currently runs on the Ruby version 2.4.1 and the Rails 5.0.2 gem. 

Additionallly, both development and production environments are configured for [PostgreSQL](https://www.postgresql.org/).

### Set up your local Git repository

  The Git Guides  detail our recommended setup for your local repository:

* Clone of the official repository
  ([git://github.com/etschmidt/gymbull.git](git://github.com/ethschmidt/gymbull.git))
* Your GitHub fork added as a remote repository
* Local tracking branches for official 'master' and 'edge' branches
* Local development branch based off 'edge' and pushed to your GitHub fork

## Installing GymBull

These are the steps to get up and running with the GymBull Rails app:

Follow the steps to clone the repository above.

	$ bundle install
	$ rails s

Check localhost:3000 for the application

### Loading sample data

Set up PostgreSQL on your local environment and ensure that the server is open for connection.

Initialize & migrate the database:

	$ rails db:setup

Then, if desred, load the seed data genereated by the Faker gem:

	$ rails db:seed

## Issues

The GymBull team tracks issues and development locally, but we are always looking for contributors to our project.
Feel free to submit pull requests concerning both bugs and features or drop us a line at [CTO@gymbull.com](mailto:cot@gymbull.com)

## License

GymBull is published under the "Don't be a Dick" License; don't be a dick.