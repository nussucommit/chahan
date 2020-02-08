# chahan
NUSSU Logistics Booking Application, Iteration 2

[![Coverage Status](https://coveralls.io/repos/github/commit-tech/chahan/badge.svg?branch=add-coveralls-to-project)](https://coveralls.io/github/commit-tech/chahan?branch=add-coveralls-to-project)

# Installation
This project uses Rails 6.0.0 and Ruby 2.6.3p62

To setup:
```bash
git clone https://github.com/commit-tech/chahan.git
cd chahan
cp config/database.yml.example config/database.yml
bundle install
bin/rails db:migrate
bin/rails db:seed
bin/rails server
```

Adjust the content of `database.yml` accordingly
