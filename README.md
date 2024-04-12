### Hexlet tests and linter status:

[![CI Status](https://github.com/owlscatcher/rails-project-63/actions/workflows/main.yml/badge.svg)](https://github.com/owlscatcher/rails-project-63/actions)
[![Actions Status](https://github.com/owlscatcher/rails-project-63/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/owlscatcher/rails-project-63/actions)

# HexletCode

Welcome. This is a simple gem for creating a form from ruby-code.

## Installation

Install the gem and add to the application's Gemfile by executing:

    $ bundle add hexlet_code

If bundler is not being used to manage dependencies, install the gem by executing:

    $ gem install hexlet_code

## Usage

```ruby
user = User.new name: 'rob', job: 'hexlet', gender: 'm'

HexletCode.form_for user do |f|
  f.input :name
  f.input :gender, label: false
  f.input :job, as: :text
  f.submit
end
```

Output:

```html
<form action="#" method="post">
  <label for="name">Name</label>
  <input name="name" type="text" value="rob" />
  <input name="gender" type="text" value="m" />
  <label for="job">Job</label>
  <textarea name="job" cols="20" rows="40">hexlet</textarea>
  <input type="submit" value="Save" />
</form>
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/owlscatcher/hexlet_code. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/owlscatcher/rails-project-63/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the HexletCode project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/owlscatcher/rails-project-63/blob/master/CODE_OF_CONDUCT.md).
