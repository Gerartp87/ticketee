source 'http://rubygems.org'

gem 'rails', '3.1.1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'  # Se podria usar otra base de datos poniendo la gema adecuada


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'dynamic_form'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug19', :require => 'ruby-debug'

group :test, :development do
  gem 'rspec-rails', '~> 2.5'
end

group :test do
  gem 'cucumber-rails', '1.0.2'
  gem 'capybara'
  gem 'database_cleaner'   # Limpia la base de datos despues de cada prueba
  gem 'factory_girl' # Para crear objetos ejemplo para las pruebas
  gem 'email_spec'
end

gem 'devise', '~> 1.4.3'