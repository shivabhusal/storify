source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby '2.3.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.1'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

gem 'mini_magick', '~> 4.5.1'

# Use Bootstrap as CSS Framework
gem 'bootstrap-sass', '~> 3.3.6'

# Use Font Awesome for Awesome Icons
gem 'font-awesome-rails', '~> 4.6.3.1'

gem 'devise'
gem 'devise-authy'

# Slim templates
gem 'slim-rails', '~> 3.1.1'
gem 'awesome_print'
gem 'annotate'
gem 'carrierwave', '~> 1.0'

# inherited_resources has been removed from Rails long ago
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
# Using master branch of ActiveAdmin in github
gem 'activeadmin', github: 'activeadmin'

gem 'friendly_id', '~> 5.1.0'
gem 'sunspot_rails', '~> 2.2.7'
gem 'bootstrap-slider-rails'
gem 'kaminari'
gem 'figaro'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry-rails', platform: :mri
  gem 'rspec-rails', '~> 3.5', require: 'rspec/rails'
end

group :test do
  gem 'webmock'
  gem 'vcr'

  gem "simplecov"
  gem "codeclimate-test-reporter", "~> 1.0.0"
  gem 'sunspot_matchers'

  gem 'faker'
  gem 'database_cleaner'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'rails-controller-testing'
end

gem 'sunspot_solr' # optional pre-packaged Solr distribution for use in development
group :development do
  gem 'rubocop', require: false
  gem 'mailcatcher', require: false # Catches emails in localhost, See https://mailcatcher.me/
  gem 'zeus', require: false

  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'


  gem 'capistrano', '3.7.1'
  gem 'capistrano3-puma'
  gem 'capistrano-bundler', '~> 1.1.2'
  gem 'capistrano-rails', '~> 1.1'
  gem 'capistrano-rvm'
  gem 'rails-erd'

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
