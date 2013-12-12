gem 'thin'
gem 'slim'
gem 'exception_notification'

gem_group :development, :test do
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'slim-rails'
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'factory_girl_rails'
  gem 'database_cleaner'
end

gem_group :assets do
  gem 'sass-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
end


gem_group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
  gem 'pg'
  gem 'dalli'
end
