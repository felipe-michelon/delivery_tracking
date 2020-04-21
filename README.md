# Delivery Tracking

This app will help you track your packages, without needing to check any website every 5 minutes

## Setup

We **strongly** recommend using [RVM](rvm.io) to run the following commands.

### Install dependencies
Using [Bundler](bundler.io) (should be installed if you are using RVM), run:
```
bundler install
```

After that, you should be able to run the app.

## Running the app

Just run:

```
ruby ./app.rb
```

## Code Maintenance

### Code styles

We use [Rubocop](https://github.com/rubocop-hq/rubocop) as a linter. To check your code, run:

```
rubocop
```


### Debugging

When you need to debug something, use [pry](https://github.com/pry/pry) as the following example:

```ruby
class Foo
  def bar
    puts 'I need to debug the next line'
    binding.pry #code will stop here
  end
end
```
