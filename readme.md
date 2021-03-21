# ReadyTech code test

## Setup

- Assumes Ruby `ruby-2.6.5` (see `.ruby-version`) file.
- `bundle install` and `bundle exec rspec .` to see the app.
- `bundle exec rubocop .` for Rubocop styleguide

## Usage

Using [IRB](https://github.com/ruby/irb), include the main `./app` directory and process files with the `process` method:

```
require './app'
process("./some-csv.csv")
# We'll respond with the path where it goes
```
