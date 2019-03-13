[![Build Status](https://semaphoreci.com/api/v1/dmitryrck/jobhunter/branches/master/badge.svg)](https://semaphoreci.com/dmitryrck/jobhunter)
[![Maintainability](https://api.codeclimate.com/v1/badges/3d3b739eef0d44796fb9/maintainability)](https://codeclimate.com/github/dmitryrck/jobhunter/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/3d3b739eef0d44796fb9/test_coverage)](https://codeclimate.com/github/dmitryrck/jobhunter/test_coverage)

# Jobhunter

App built on top of ActiveAdmin to help keeping track of job applications.

## Running

```terminal
$ cp docker-compose.yml.sample docker-compose.yml
$ cp config/database.yml.sample config/database.yml
$ docker-compose run --rm app bundle install
$ docker-compose run --rm app bundle exec rake db:create
$ docker-compose run --rm app bundle exec rake db:migrate
$ docker-compose up app
```

Access [localhost:3000](http://localhost:3000).
