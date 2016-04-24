# DishCombinationFinder

This gem provides a solution to the restaurant ordering problem found in [xkcd.com/287](https://xkcd.com/287/).

Inputting a .txt file path (as specified with desired price and menu options) will yield one possible combination to the problem if it exists.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dish_combination_finder', git: 'https://github.com/kdank/dish_combination_finder'
```

And then execute:

    $ bundle

Or install it yourself.  Note that this gem is not currently hosted on any gem so you will have to use specific_install:

    $ gem install specific_install
    $ gem specific_install -l https://github.com/kdank/dish_combination_finder.git

## Usage

#### Make & format txt file

First you must create a txt file with a price and menu items like this example:

```text
$15.05
mixed fruit,$2.15
french fries,$2.75
side salad,$3.35
hot wings,$3.55
mozzarella sticks,$4.20
sampler plate,$5.80
```

Other examples not in the xkcd example work as well:

```text
$3.05
taco,$1.05
burrito,$2.00
```
Don't forget the `$` character!

#### Open irb and Run the gem

```ruby
MacBook-Air:projects Jacob$ irb
:001 > require 'dish_combination_finder'
 => true
:002 > DishCombinationFinder::Director.combinations_from_txt('menu.txt')
 => "You can get exactly get exactly 15.05 worth of dishes by ordering the following: mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit, mixed fruit"
```

## Known Defiencies/ToDos
 
- [ ] txt file validation: no hints given when file is formatted incorrectly
- [ ] txt file validation: Validation is very weak.  program likely to run and fail on stack level too deep with improper file format.
- [ ] Add nice formatting to solution.  It would be nice to see `3 mixed fruit` instead of `mixed fruit, mixed fruit, mixed fruit`
- [ ] Break after first solution is found.  Currently we find all the solutions and return only the first.
- [ ] Make method to find multiple combinations.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

If you are interesting in developing further functionality and you run into trouble, make a git issue and we will go from there.

## Contributing

1. Fork it ( https://github.com/[my-github-username]/dish_combination_finder/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

