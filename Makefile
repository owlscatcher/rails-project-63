install:
	bundle install
build:
	bundle exec rubocop -a
	rake test
