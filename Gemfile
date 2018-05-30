source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.2'

group :production do
  # Use pg as the production database for Active Record
  gem 'pg'
end

group :development do
  # Use sqlite3 as the development database for Active Record
  gem 'sqlite3'
  gem 'web-console', '~> 2.0'
  gem "better_errors"
  gem "binding_of_caller"
end

group :development, :test do
  gem 'rspec-rails', '~> 3.7'
  gem 'rails-controller-testing'
  gem 'shoulda'
  gem 'ffaker'
  gem 'factory_bot_rails'
end

# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'thor', '0.19.1'

gem 'twitter-typeahead-rails'

gem 'bootstrap-sass'

gem 'acts_as_votable', '~> 0.11.1'

gem 'buttercms-rails'

gem 'devise'

gem 'figaro'

gem 'mail_form'

gem 'simple_form'

gem 'geocoder'

gem 'pundit'

gem 'carrierwave', '~> 1.0'

gem 'carrierwave-video'

gem 'rmagick'

gem 'kaminari'

gem 'kaminari-bootstrap'

gem 'mailboxer'

gem 'stripe'

gem 'chosen-rails'

group :development do
  gem 'listen', '~> 3.0.5'
end
