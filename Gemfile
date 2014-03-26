source 'https://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.4'
gem 'pg'

# parsers
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'haml-rails'

# javascript
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

# bootstrap
gem 'bootstrap-sass'

# progress bar
gem 'nprogress-rails'

# user management
gem 'devise'

# app config via application.yml
gem 'figaro'

# email
gem 'sendgrid'

# friendly URLs
gem 'friendly_id'

# error reporting
gem 'rollbar'

# monitoring
gem 'newrelic_rpm'

# pagination
gem 'kaminari'

# not in dev block because of heroku
gem 'awesome_print'       # for pretty console printing

# for the rake deploy task
# unfortunately uses a very old version of the gem due to excon gem's compatibility issues with fog
# comment it out when needing the latest heroku binary from the toolbelt
gem 'heroku', :require => false

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :rbx]
  gem 'html2haml'
  gem 'hub', :require=>nil
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'annotate',           :git => 'git://github.com/ctran/annotate_models.git'
end

group :development, :test do
  gem 'factory_girl_rails'
  gem 'rspec-rails'
  gem 'thin'
end

group :production do
  gem 'unicorn'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner', '1.0.1'
  gem 'email_spec'
end
