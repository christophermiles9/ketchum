# Ketchum

This is a simple Ruby wrapper for the [PokeAPI](pokeapi.co). As far as I can tell, this is the only Ruby wrapper that supports v2 of the API and has functionality for all JSON resources. Pretty much anything you can do with the API you can do with this wrapper.

I also have a bunch of ideas for ways to improve this gem. Take a look down at Future Developments if you're interested.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ketchum'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ketchum

## Usage

```ruby
require 'ketchum'

ketchum = Ketchum::Client.new

bulbasaur = ketchum.pokemon(1)
```

Ketchum supports all JSON resources that PokeAPI v2 serves. The gem follows standard Ruby convention (i.e. berry_firmness instead of berry-firmness). For most resources, you can enter the id or name as a parameter. This is dictated by what PokeAPI accepts as parameters. This may not be the case in future updates.

You can also request a resource without giving any parameters. This returns a list of all URLs for that resource.

```ruby
all_pokemon = ketchum.pokemon
```

As of now, Ketchum supports three format options. The default is to return the JSON returned from the API. The gem can also return hashes and ostructs. You can specify a format for an individual request or set it as default when you instantiate a client.

```ruby
# Returns raw JSON
bulbasaur = ketchum.pokemon(1)
bulbasaur = ketchum.pokemon(1, :json)

# Returns hash for this one request
bulbasaur = ketchum.pokemon(1, :hash)

# Returns ostruct for this one request
bulbasaur = ketchum.pokemon(1, :ostruct)

# Returns hash as default for all requests
ketchum_hash = Ketchum::Client.new(:hash)
bulbasaur_hash = ketchum_hash.pokemon(1)
```

## Future Development

1. Set up caching. Ideally I would like a cache that sits on the user's computer, considering the information does not change that frequently. If not, a new cache for every instance of client.
2. Develop object format. Make each JSON key into a full-fledged object with its own attributes and methods, loosely following the model on PokeAPI.
3. Expand already existing PokeAPI resources. A resource like evolution_chain should be able to take a Pokemon's name or the id of a Pokemon in that chain.
4. Make new resources by combining information already in the API.
5. Develop a search function that will take the type of resource you're looking for and parameters for that resource.
6. Add documentation for each resource to the README.
7. Develop testing framework. Not having caching figured out yet is partly why I'm staying away from this.
    
## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/ketchum.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

