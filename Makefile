install:
	bundle install
tests:
	rake test -v
lint:
	bundle exec rubocop -a
